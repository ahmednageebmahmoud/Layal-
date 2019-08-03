ngApp.controller('eventSurveyQuestionsCtrl', ['$scope', '$http', 'eventSurveyQuestionsServ', function (s, h, eventSurveyQuestionsServ) {
    s.state = StateEnum;
    s.eventSurveyQuestions = [];
    s.eventSurveyQuestionTypes = [];
    s.eventSurveyQuestionFOP = {};
    s.newEventSurveyQuestion = {
        SurveyQuestionTypeId: null,
        NameEn: null
    }

    s.eventSurveyQuestionTypes = [{
        Id: null,
        EventSurveyQuestionTypeName: Token.select
    }];


    //============= G E T =================
    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();
        eventSurveyQuestionsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.eventSurveyQuestionTypes = s.eventSurveyQuestionTypes.concat(d.data.Result.EventSurveyQuestionTypes);


                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getItems", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getItems", err);
        })
    };

    s.geSurveyDefaultQuestions = () => {
        let loading = BlockingService.generateLoding();
        loading.show();
        eventSurveyQuestionsServ.geSurveyDefaultQuestions().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.eventSurveyQuestions = s.eventSurveyQuestions.concat(d.data.Result);
                        s.eventSurveyQuestionFOP = new FOP(lengthWithOutDeleted(s.eventSurveyQuestions));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - geSurveyDefaultQuestions", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - geSurveyDefaultQuestions", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.eventSurveyQuestionFrmErrorSubmit = true;
            return;
        }
        s.eventSurveyQuestionFrmErrorSubmit = false;
        s.newEventSurveyQuestion.State = StateEnum.create;
        s.newEventSurveyQuestion.IsDefault = true;

        
        BlockingService.block();
        eventSurveyQuestionsServ.saveChange(s.newEventSurveyQuestion).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.eventSurveyQuestions.push(d.data.Result);
                        s.newEventSurveyQuestion = {};

                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //============= Delete ================
    s.delete = eventSurveyQuestion => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            eventSurveyQuestion.State = StateEnum.delete;
            BlockingService.block();
            eventSurveyQuestionsServ.saveChange(eventSurveyQuestion).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.eventSurveyQuestions.splice(s.eventSurveyQuestions.findIndex(c => c.Id == eventSurveyQuestion.Id), 1)
                            s.reFop(s.eventSurveyQuestions.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= E D I T I  =================
    s.changeActive = qu=> {
        qu.State = StateEnum.update;
        BlockingService.block();
        eventSurveyQuestionsServ.saveChange(qu).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        qu.IsActive = d.data.Result.IsActive;
                    } break;
                default: {

                    qu.IsActive = !qu.IsActive;
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                }
                    break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - changeActive", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - changeActive", err);
        })
    };




    //============= Other =================
    s.checkAllowDisplay = (priv) => {
        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };

    //للتحقق القيم المطلوبة
    s.propertyIsFalthy = (prop, propChange) => {
        return prop ? false : true;

    }
    //للتحقق من عدد القيم المدخلة 
    s.propertyIsMaxLength = (prop, mxLength) => {
        if (!prop) return false;
        return prop.length > mxLength;
    };

    //Call Functions
    s.getItems();
    s.geSurveyDefaultQuestions();
}]);