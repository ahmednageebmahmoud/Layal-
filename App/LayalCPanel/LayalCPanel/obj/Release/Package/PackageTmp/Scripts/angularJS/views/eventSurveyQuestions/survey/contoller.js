ngApp.controller('eventSurveyQuestionsCtrl', ['$scope', '$http', 'eventSurveyQuestionsServ', function (s, h, eventSurveyQuestionsServ) {
    s.state = StateEnum;

    s.eventId = getQueryStringValue('eventId');
    s.eventSurvey = { IsSatisfied: true,EventId:s.eventId };

    //============= G E T =================
     s.getEvent = () => {
         if (!s.eventId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
         eventSurveyQuestionsServ.getEvent(s.eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.event = d.data.Result;
                    s.isFinshed = s.event.CoordinationWorkStatus.IsFinshed
                } break;
                default:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEvent", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvent", err);
        });
    }

    s.getEventSurvey = () => {
        let loading = BlockingService.generateLoding();
        loading.show();
        eventSurveyQuestionsServ.getEventSurvey(s.eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.eventSurvey = d.data.Result;

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - geSurveyQuestions", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - geSurveyQuestions", err);
        })
    };

    //=-=-=-=-=-=-=- Update -=-==-=-=
    s.saveChange = frm => {
        if (frm.$invalid || s.eventSurvey.IsSatisfied == null) {
            s.eventFormSubmitErro = true;
            return;
        }
        s.eventFormSubmitErro = false;

        BlockingService.block();
        eventSurveyQuestionsServ.saveChange(s.eventSurvey).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - saveChange", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        });

    }

    //Call Functions
    s.getEventSurvey();
    s.getEvent();
}]);