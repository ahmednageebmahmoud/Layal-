using BLL.Enums;
using BLL.Services;
using BLL.SignalAr;
using BLL.ViewModels;
using Resources;
using Resources.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace BLL.BLL
{
    public class OrdersPaymentsBll : BasicBLL
    {

        /// <summary>
        /// اضافة دفعة مالية بواسطة العميل ودائما تكون تحويل بنكى 
        /// اى ان هناك صورة حوالة بنكية
        /// </summary>
        /// <param name="o"></param>
        /// <returns></returns>
        public object AddPaymentByClinet(OrderPaymentVM o)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //اذا هى عملية حجز عن طريق حوالة بنكية

                    var FileSave = FileService.SaveFileHttpBase(new FileSaveVM
                    {
                        File = o.File,
                        ServerPathSave = "/Files/Orders/Payments/"
                    });
                    if (!FileSave.IsSaved)
                        return ResponseVM.Error(Token.CanNotSaveBankTransferPhoto);
                    o.TransferImageUrl = FileSave.SavedPath;

                    long? PaymentId = db.Phot_OrderPayments_Insert(o.OrderId, o.Amount, o.TransferImageUrl,  this.UserLoggad.Id, (int)PaymentTypeEnum.BankTransfer).FirstOrDefault();

                    //Check If Inserted
                    if (!PaymentId.HasValue)
                        return ResponseVM.Error(Token.SomeErrorHasBeen);

                    //Save And Sent Notification
                    NotificationsBLL NotificationsBLL = new NotificationsBLL();
                    var Notify = new NotifyVM
                    {
                        TitleAr = string.Format("عملية دفع جديدة لـ طلب رقم {0}", o.OrderId),
                        TitleEn = string.Format("New Payment Process For Order {0}", o.OrderId),
                        DescriptionAr = string.Format("لقد قام العميل {0} باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها {1}", this.UserLoggad.FullName, o.Amount),
                        DescriptionEn = string.Format("The customer {0} has added a new payment for a bank transfer of {1}", this.UserLoggad.FullName, o.Amount),
                        DateTime = DateTime.Now,
                        TargetId = o.OrderId,
                        PageId = PagesEnum.PhotoOrdersMangment,
                        RedirectUrl = $"/PhotoOrdersMangment/Details?id={o.OrderId}&go=w_payment&notifyId=",
                    };

                    //Send Notification To Manger
                    NotificationsBLL.Add(Notify, this.AdminId);
                    new NotificationHub().SendNotificationToSpcifcUsers(this.AdminId, Notify);

                    o.Id = PaymentId;
                    o.IsBankTransfer = true;
                    o.CreateDateTime = DateTime.Now;
                    o.File = null;
                    tran.Commit();
                    return ResponseVM.Success(Token.Add, o);
                }
                catch (Exception ex)
                {
                    FileService.RemoveFile(o.TransferImageUrl);
                    tran.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }

        public object AddPaymentByAdmin(OrderPaymentVM o)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    if (db.Phot_Orders_CheckIfActive(o.OrderId).Any(c => c.Value > 0))
                        return ResponseVM.Error($"{Token.Order} {Token.NotActivate}");

                    var UserCreatedOrderId = db.Phot_OrderPayments_InsertV2(o.OrderId, o.Amount,  this.UserLoggad.Id,
                        o.PaymentTypeId,o.IsAcceptFromManger,o.AcceptNotes, DateTime.Now).FirstOrDefault();

                    //Check If Inserted
                    if (!UserCreatedOrderId.HasValue)
                        return ResponseVM.Error(Token.SomeErrorHasBeen);



                    //Save And Sent Notification
                    NotificationsBLL NotificationsBLL = new NotificationsBLL();
                    var Notify = new NotifyVM
                    {
                        TitleAr = string.Format("عملية دفع جديدة لـ طلب رقم {0}", o.OrderId),
                        TitleEn = string.Format("New Payment Process For Order {0}", o.OrderId),
                        DescriptionAr = string.Format("لقد قام الموظف {0} باضافة عملية دفع جديدة عن طرق حوالة بنكية وقيمتها {1}", this.UserLoggad.FullName, o.Amount),
                        DescriptionEn = string.Format("The employee {0} has added a new payment for a bank transfer of {1}", this.UserLoggad.FullName, o.Amount),
                        DateTime = DateTime.Now,
                        TargetId = o.OrderId,
                        PageId = PagesEnum.PhotoOrdersMangment,
                        RedirectUrl = $"/PhotoOrders/Details?id={o.OrderId}&go=w_payment&notifyId=",
                    };

                    //Send Notification To Manger
                    NotificationsBLL.Add(Notify, UserCreatedOrderId.Value);
                    new NotificationHub().SendNotificationToSpcifcUsers( UserCreatedOrderId.Value, Notify);

                    tran.Commit();
                    return ResponseVM.Success(Token.Add);
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return ResponseVM.Error(Token.SomeErrorHasBeen);
                }
            }
        }
        public object AcceptTransfare(OrderPaymentVM payment)
        {
            try
            {
                //Check If This Order If Cancled
                if (!db.Phot_Orders_CheckIfCancled(payment.OrderId).Any(c => c.Value))
                    return ResponseVM.Error(Token.OrderIsCancledMessage);

                /*
                 عمليات الموافقة تكون على التحويلات البنكير فقط
                 */
                db.Phot_OrderPayments_Accept(payment.Id, payment.OrderId, payment.IsAcceptFromManger, payment.AcceptNotes);

                //Send Notification To Clinet
                NotificationsBLL NotificationsBLL = new NotificationsBLL();
                var Notify = new NotifyVM
                {
                    DateTime = DateTime.Now,
                    TargetId = payment.OrderId,
                    PageId = PagesEnum.PhotoOrdersMangment,
                    RedirectUrl = $"/PhotoOrders/Details?id={payment.OrderId}&go=w_payment&notifyId=",
                };

                if (payment.IsAcceptFromManger.Value)
                {
                    //Accept
                    Notify.TitleAr = string.Format("تم الموافقة على عملية دفع لـ الطلب رقم {0}", payment.OrderId);
                    Notify.TitleEn = string.Format("Accepted Payment Process For Order {0}", payment.OrderId);
                    Notify.DescriptionAr = string.Format("لقد قامت الادارة بـ الموافقة على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها {0}", payment.Amount);
                    Notify.DescriptionEn = string.Format("The mangment has accepted youre new payment for a bank transfer of {0}", payment.Amount);
                }
                else
                {
                    //Reject
                    Notify.TitleAr = string.Format("تم رفض عملية دفع لـ الطلب رقم {0}", payment.OrderId);
                    Notify.TitleEn = string.Format("Rejected Payment Process For Order {0}", payment.OrderId);
                    Notify.DescriptionAr = string.Format(" لقد قامت الادارة بـ الرفض على عملية دفع جديدة عن طرق حوالة بنكية وقيمتها {0} ", payment.Amount);
                    Notify.DescriptionEn = string.Format("The mangment has rejected youre new payment for a bank transfer of {0}", payment.Amount);
                }

                //Send Notification To Manger
                NotificationsBLL.Add(Notify, payment.UsereCreatedId);
                new NotificationHub().SendNotificationToSpcifcUsers( payment.UsereCreatedId, Notify);

                payment.AcceptDateTime = DateTime.Now;
                return ResponseVM.Success(Token.Saved, payment);
            }
            catch (Exception ex)
            {
                return ResponseVM.Error(Token.SomeErrorHasBeen, ex);
            }
        }

        public List<OrderPaymentVM> GetPaymentsByOrderId(long orderId)
        {
            return db.Phot_OrderPayments_SelectByOrderId(orderId).Select(c => new OrderPaymentVM
            {
                Id = c.Id,
                Amount = c.Amount,
                IsAcceptFromManger = c.IsAcceptFromManger,
                CreateDateTime = c.PaymentDateTime,
                OrderId = c.FkOrder_Id,
                TransferImageUrl = c.TransferImage,
                AcceptNotes = c.AcceptNotes,
                UsereCreatedId=c.FKUserCreated_Id,
                AcceptDateTime = c.AcceptDateTime,
                PaymentType=new PaymentTypeVM {
                NameAr=c.PaymentType_NameAr,
                NameEn=c.PaymentType_NameEn,
                }
            }).ToList();
        }
    }//End Class
}
