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
    public class EventSurveyQuestionsBLL : BasicBLL
    {

        public object GetEventSurveyQuestions(long id)

        {
            var EventSurveyQuestions = db.EventSurveyQuestions_SelectByEventId(id).Select(c => 
            new EventSurveyQuestionVM
            {
                Id = c.Id,
                SurveyQuestionTypeId = c.SurveyQuestionTypeId,
                EventId = id,
                SurveyQuestion = new EventSurveyQuestionTypeVM
                {
                    NameAr = c.SurveyQuestionTypeNameAr,
                    NameEn = c.SurveyQuestionTypeNameEn
                }
            }).ToList();

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventSurveyQuestions);
        }

        public bool CheckAllowAccessToEventSurvey(long eventId)
        {
            //التحقق ان الاستفسار لم يغلق بعد
            return CheckIfMyEnquiry(eventId);
        }
        /// <summary>
        /// التحقق ان المسخدم الحالى هوا صاحب هذا الاستفسار
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool CheckIfMyEnquiry(long id)
        {
            return db.Enquires_CheckFromOwner(id, this.UserLoggad.Id).First().Value > 0;
        }

        public object GetEventSurvey(long id)
        {

            var EventSurvey = db.EventSurveies_SelectByPK(id).Select(c => new EventSurveyVM
            {
                EventId = id,
                IsSatisfied = c.IsSatisfied
            }).FirstOrDefault();
            if (EventSurvey == null)
                EventSurvey = new EventSurveyVM
                {
                    EventId = id,
                    IsSatisfied = true
                };

            EventSurvey.SurveyQuestions=db.EventSurveyQuestions_SelectByEventId(id).Select(c =>
          new EventSurveyQuestionVM
          {
              Id = c.Id,
              SurveyQuestionTypeId = c.SurveyQuestionTypeId,
              EventId = id,
              Answerer=c.Answerer,
              SurveyQuestion = new EventSurveyQuestionTypeVM
              {
                  NameAr = c.SurveyQuestionTypeNameAr,
                  NameEn = c.SurveyQuestionTypeNameEn
              }
          }).ToList();
            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventSurvey);

        }

        private bool CheckIfEnquiryClosed(long enquiryId)
        {
            return db.Enquires_IsClosed(enquiryId).First().Value > 0;
        }
        public object SaveChange(EventSurveyQuestionVM c)
        {

            using (var tranc = db.Database.BeginTransaction())
            {
                try
                {

                    var ObjectReturn = new object();
                    switch (c.State)
                    {
                        case StateEnum.Create:
                            ObjectReturn = Add(c);
                            break;
                        case StateEnum.Update:
                            ObjectReturn = Update(c);
                            break;
                        case StateEnum.Delete:
                            ObjectReturn = Delete(c); break;
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

        public object SaveChangeSurveyAnswerer(EventSurveyVM eventSur)
        {
            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    //التحقق انة لم يمر شهر على ذالك الحدث
                    if (CheckIfEnquiryClosed(eventSur.EventId))
                        return new ResponseVM(RequestTypeEnum.Error, Token.SurveyValidIn30DaysAffterEventFinshed);

                    //التحقق ان الحدث لم يغلق بعد
                    if (CheckIfEnquiryClosed(eventSur.EventId))
                        return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

                    //Remove Old Saved
                    db.EventSurveyQuestionAnswerer_DeleteByEventSurveyId(eventSur.EventId);
                    db.EventSurveies_DeleteByEventId(eventSur.EventId);

                    //Add New 
                    db.EventSurveies_Insert(eventSur.EventId, this.UserLoggad.Id, eventSur.IsSatisfied);
                    eventSur.SurveyQuestions.ForEach(c =>
                    {
                        db.EventSurveyQuestionAnswerer_Insert(c.Id, c.Answerer, DateTime.Now, c.SurveyQuestionTypeId, eventSur.EventId);
                    });
                    tran.Commit();
                    return new ResponseVM(RequestTypeEnum.Success, Token.Success, eventSur);
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
                }
            }
        }

        private bool CheckIfEnquiryClosed(object eventId)
        {
            throw new NotImplementedException();
        }

        public object GetSurveyQuestionsforUpdateEventSurvey(int id)
        {

            var EventSurveyQuestions = db.EventSurveyQuestions_WithEvent(id).Select(c => new EventSurveyQuestionVM
            {
                SurveyQuestionTypeId = c.SurveyQuestionTypeId,
                EventId = c.FKEvent_Id,
                IsSelected = c.IsSelected > 0,
                SurveyQuestion = new EventSurveyQuestionTypeVM
                {
                    NameAr = c.SurveyQuestionTypeAr,
                    NameEn = c.SurveyQuestionTypeEn,
                }
            }).ToList();

            if (EventSurveyQuestions.Count == 0)
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventSurveyQuestions);
        }

        public object GetDefaultQuestions()
        {
            var EventSurveyQuestions = db.EventSurveyQuestions_SelectDefault(null).Select(c => new EventSurveyQuestionVM
            {
                Id = c.Id,
                IsActive = c.IsActive,
                IsDefault = c.IsDefault,
                EventId = c.FKEvent_Id,
                SurveyQuestionTypeId = c.FKSurveyQuestionType_Id,
            }).ToList();

            if (EventSurveyQuestions.Count == 0)
                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventSurveyQuestions);

        }

        private object Delete(EventSurveyQuestionVM c)
        {
            if (db.EventSurveyQuestions_CheckIfUsed(c.Id).First().Value > 0)
                return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);

            db.EventSurveyQuestions_Delete(c.Id);
            return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
        }

        public object SaveEventQuestions(List<EventSurveyQuestionVM> dis)
        {
            try
            {
                //التحقق ان الاستفسار لم يغلق بعد
                if (CheckIfEnquiryClosed(dis[0].EventId.Value))
                    return new ResponseVM(RequestTypeEnum.Error, Token.EnquiryIsClosed);

                if (dis == null || dis.Count == 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.Updated);

                //check if not inserted Survey
                if (db.EventSurvey_CheckIfIsInserted(dis[0].EventId).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Error, Token.CanNotUpdateBecuseClinetIsFillSurvey);

                //Remove All By Eent Id
                db.EventSurveyQuestions_RemoveByEventId(dis[0].EventId);

                //Add New By Event 
                dis.Where(c => c.IsSelected).ToList().ForEach(c =>
                 {
                     ObjectParameter ID = new ObjectParameter("Id", typeof(long));
                     db.EventSurveyQuestions_Insert(ID, null, c.SurveyQuestionTypeId, c.EventId, null);
                 });

                return new ResponseVM(RequestTypeEnum.Success, Token.Updated);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(EventSurveyQuestionVM c)
        {
            db.EventSurveyQuestions_Update(c.Id, c.IsDefault, c.IsActive);
            return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
        }

        private object Add(EventSurveyQuestionVM c)
        {
            if (db.EventSurveyQuestions_CheckIfInserted(c.SurveyQuestionTypeId).First().Value > 0)
                return new ResponseVM(RequestTypeEnum.Error, Token.CanNotDuplicate);


            ObjectParameter ID = new ObjectParameter("Id", typeof(long));
            db.EventSurveyQuestions_Insert(ID, c.IsDefault, c.SurveyQuestionTypeId, c.EventId, c.IsActive);
            c.Id = (long)ID.Value;
            return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
        }



    }//End Class
}
