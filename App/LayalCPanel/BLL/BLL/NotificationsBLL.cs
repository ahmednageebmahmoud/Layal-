using BLL.Enums;
using BLL.ViewModels;
using Resources;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLL
{
    public class NotificationsBLL : BasicBLL
    {

        public object GetNotifications(int skip,int take, int? pageId,bool? isRead)

        {
            var Notifications = db.Notifications_SelectByFilter(skip,take, pageId, isRead,this.UserLoggad.Id).Select(c => new NotifyVM
            {
                Id = c.Id,
                TitleAr = c.TitleAr,
                TitleEn = c.TitleEn,
                DescriptionAr = c.DescriptionAr,
                DescriptionEn = c.DescriptionEn,
                DateTime = c.DateTime,
                PageId = c.FKPage_Id,
                RedirectUrl = c.RedirectUrl,
                TargetId=c.Target_Id,
                NotificationsCount=c.NotificationsCount,
                IsRead=c.IsRead
            }).ToList();

            if (Notifications.Count == 0)
            {

                return new ResponseVM(Enums.RequestTypeEnum.Info, $"{Token.Notifications} : {Token.NoResult}");

            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, Notifications);
        }

        public object ReadNotification(Int64 notifyId)
        {
            db.NotificationsUser_Read(notifyId, this.UserLoggad.Id);
            return null;
        }

        public Int64 Add(NotifyVM c,Int64 userTargrtId)
        {

            ObjectParameter ID = new ObjectParameter("Id", typeof(Int64));
            db.Notifications_Insert(ID,c.DateTime,c.TargetId,c.PageId,this.UserLoggad.Id, c.TitleAr, c.TitleEn, c.DescriptionAr,c.DescriptionEn,c.RedirectUrl, userTargrtId);
            c.Id = (Int64)ID.Value;
            return c.Id;
        }



    }//End Class
}
