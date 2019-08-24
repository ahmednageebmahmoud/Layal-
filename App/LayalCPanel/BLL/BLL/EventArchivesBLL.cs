using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.ViewModels;
using BLL.Enums;
using Resources;
using System.Data.Entity.Core.Objects;

namespace BLL.BLL
{
    public class EventArchivesBLL : BasicBLL
    {

        /// <summary>
        /// التحقق ان المستخدم الحالى يحق لة التغير فى الاعدادات
        /// </summary>
        /// <param name="evenId"></param>
        /// <returns></returns>
        public bool CheckAlloweAccess(long evenId)
        {
            return db.Employees_CheckAllowAccessToEventForUpdateWorks(
                this.UserLoggad.IsAdmin,
                this.UserLoggad.IsClinet,
                this.UserLoggad.IsBranchManager,
                evenId,
                (int)WorksTypesEnum.ArchivingAndSaveing,
                this.UserLoggad.Id,
                this.UserLoggad.BrId).First().Value > 0;

        }
        public object EventArvhivSDetailaveChange(EventArchivDetailVM c)
        {
            //التحقق من امكانية الوصول الى المناسبة
            if (!CheckAlloweAccess(c.EventId.Value))
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);

            //التحقق ان هذة المهمة لم تنتهى مع هذا الفرع
            if (db.EventWorksStatusHistory_CheckIfTaskFinshedWithBranch(c.EventId, this.UserLoggad.BrId, (int)WorksTypesEnum.ArchivingAndSaveing, true).First().Value)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisTaskIsFinshed);


            //التحقق لان المناسبة لم تغلق
            if (new EnquiresBLL().CheckIfEnquiryClosed(c.EventId.Value))
                return new ResponseVM(RequestTypeEnum.Error, Token.EventIsClosed);



            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = AddDetail(c);
                            break;
                        case StateEnum.Delete:
                            ObjectReturn = DeleteDetail(c); break;
                            break;
                        default:
                            return new ResponseVM(RequestTypeEnum.Error, Token.StateNotFound);
                    }
                    tranc.Commit();
                    return ObjectReturn;
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }

        }

        private object DeleteDetail(EventArchivDetailVM c)
        {
            try
            {
                db.EventArchivesDetails_Delete(c.Id, c.EventId, c.EventArchivId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object AddDetail(EventArchivDetailVM c)
        {
            try
            {

                ObjectParameter Id = new ObjectParameter("Id", typeof(long));
                db.EventArchivesDetails_Inserrt(Id, c.EventId, c.EventArchivId, c.MemoryId, c.MemoryType, c.PhotoStartName, c.PhotoNumberFrom, c.PhotoNumberTo, c.Notes, DateTime.Now);
                c.Id = (long)Id.Value;
                return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public object EventArvhivSaveChange(EventArchivVM c)
        {
            //التحقق من امكانية الوصول الى المناسبة
            if (!CheckAlloweAccess(c.EventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.YouCanNotAccessToThisEvent);

            //التحقق ان هذة المهمة لم تنتهى مع هذا الفرع
            if (db.EventWorksStatusHistory_CheckIfTaskFinshedWithBranch(c.EventId, this.UserLoggad.BrId, (int)WorksTypesEnum.ArchivingAndSaveing, true).First().Value)
                return new ResponseVM(RequestTypeEnum.Error, Token.ThisTaskIsFinshed);


            //التحقق لان المناسبة لم تغلق
            if (new EnquiresBLL().CheckIfEnquiryClosed(c.EventId))
                return new ResponseVM(RequestTypeEnum.Error, Token.EventIsClosed);



            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {
                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = AddEventArvhif(c);
                            break;
                        case StateEnum.Update:
                            ObjectReturn = UpdateEventArvhif(c); break;
                            break;
                        default:
                            return new ResponseVM(RequestTypeEnum.Error, Token.StateNotFound);
                    }
                    tranc.Commit();
                    return ObjectReturn;
                }
                catch (Exception ex)
                {
                    tranc.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }

        }

        private object UpdateEventArvhif(EventArchivVM c)
        {
            try
            {
                //Insert Now    
                db.EventArchives_Update(c.Id, c.EventId,  c.HardDiskNumber, c.FolderName);
                return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        /// <summary>
        /// اضافة الهيدر الخاص بـ الارشيف
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public object AddEventArvhif(EventArchivVM c)
        {
            try
            {
                //Insert Now    
                ObjectParameter Id = new ObjectParameter("Id", typeof(int));
                db.EventArchives_Insert(Id, c.EventId, c.FolderName, c.HardDiskNumber, DateTime.Now, this.UserLoggad.Id);
                c.Id = Convert.ToInt32(Id.Value);

                return new ResponseVM(RequestTypeEnum.Success, Token.Success, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        public object GetArchives(long eventId)
        {
            var Details = db.EventArchives_SelectAll(eventId, this.UserLoggad.Id)
                .GroupBy(c => new
                {
                    c.EV_Id,
                    c.EV_EventId,
                    c.EV_UserId,
                    c.EV_FolderName,
                    c.EV_HardDiskName,
                    c.EV_DateTime,
                }).Select(c => new EventArchivVM
                {
                    Id = c.Key.EV_Id,
                    EventId = c.Key.EV_EventId,
                    UserId = c.Key.EV_UserId,
                    FolderName = c.Key.EV_FolderName,
                    HardDiskNumber = c.Key.EV_HardDiskName,
                    DateTime = c.Key.EV_DateTime,
                    EventArchivDetails = c.Where(v=> v.EVD_DateTime.HasValue).Select(v => new EventArchivDetailVM
                    {
                        Id = v.EVD_Id,
                        EventArchivId=c.Key.EV_Id,
                        EventId = eventId,
                        DateTime = v.EVD_DateTime,
                        MemoryId = v.EVD_MemoryId,
                        MemoryType = v.EVD_MemoryType,
                        Notes = v.EVD_Notes,
                        PhotoNumberFrom = v.EVD_PhotoNumberFrom,
                        PhotoNumberTo = v.EVD_PhotoNumberTo,
                        PhotoStartName = v.EVD_PhotoStartName
                    }).ToList()
                }).FirstOrDefault();

            return new ResponseVM(RequestTypeEnum.Success, Token.Success, Details);

        }


    }//end class
}
