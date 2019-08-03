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
    public class EventSurveyQuestionTypesBLL : BasicBLL
    {

        public object GetEventSurveyQuestionTypes(int? skip, int? take)

        {
            var EventSurveyQuestionTypes = db.EventSurveyQuestionTypes_SelectByFilter(skip, take).Select(c => new EventSurveyQuestionTypeVM
            {
                Id = c.Id,
                WordId = c.FKWord_Id,
                NameAr = c.NameAr,
                NameEn = c.NameEn
            }).ToList();

            if (EventSurveyQuestionTypes.Count == 0)
            {
                if (skip == 0)
                    return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoResult);

                return new ResponseVM(Enums.RequestTypeEnum.Info, Token.NoMoreResult);
            }

            return new ResponseVM(Enums.RequestTypeEnum.Success, Token.Success, EventSurveyQuestionTypes);
        }

        public object SaveChange(EventSurveyQuestionTypeVM c)
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

        private object Delete(EventSurveyQuestionTypeVM c)
        {
            try
            {
                if (db.EventSurveyQuestionTypes_CheckIfUsed(c.Id).First().Value > 0)
                    return new ResponseVM(RequestTypeEnum.Success, Token.CanNotDeleteBecuseIsUsed);
                db.EventSurveyQuestionTypes_Delete(c.Id,c.WordId);
                return new ResponseVM(RequestTypeEnum.Success, Token.Deleted, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Update(EventSurveyQuestionTypeVM c)
        {
            try
            {
                db.EventSurveyQuestionTypes_Update(c.Id, c.NameAr, c.NameEn, c.WordId,c.InputType);
                return new ResponseVM(RequestTypeEnum.Success, Token.Updated, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }

        private object Add(EventSurveyQuestionTypeVM c)
        {
            try
            {
                ObjectParameter ID = new ObjectParameter("Id", typeof(int));
                db.EventSurveyQuestionTypes_Insert(ID, c.NameAr, c.NameEn,c.InputType);
                c.Id = (int)ID.Value;
                return new ResponseVM(RequestTypeEnum.Success, Token.Added, c);
            }
            catch (Exception ex)
            {
                return new ResponseVM(RequestTypeEnum.Error, Token.SomeErrorHasBeen, ex);
            }
        }



}//End Class
}
