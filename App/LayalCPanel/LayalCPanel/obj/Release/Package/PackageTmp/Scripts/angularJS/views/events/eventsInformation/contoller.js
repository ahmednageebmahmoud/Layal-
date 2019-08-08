ngApp.controller('eventsCtrl', ['$scope', '$http', 'eventsServ', function (s, h, eventsServ) {
    s.state = StateEnum;
    s.events = [];
    s.eventFOP = {};
    s.UploadLogoNotes = LangIsEn ? "If is not upload logo or not upload good logo it will automatically be replaced with a logo from the lab" : "اذا لم يتم تحميل شعار او لم يتم تحميل شعار جديد سوف يتم استبدالة بشعار من المعمل بشكل تلقائى";

    var eventId = getQueryStringValue("id");
    s.event = {
        Id: eventId,
        State: eventId ? StateEnum.update : StateEnum.create,
        EnquiryId: getQueryStringValue("enquiryId"),
        PrintNameTypeId: null,
        Package: null
    };


    //============= G E T =================

    //Get Events
    s.getEvent = () => {
        if (!eventId)
            return;

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getEvent(eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.event = d.data.Result.Event;
                    s.event.EventDateTime = new Date(Date.parse(s.event.EventDateTimeDisplay))

                    s.enquiry = d.data.Result.Enquiry;
                    s.package = d.data.Result.Package;

                    s.event.EventDateTime = new Date(Date.parse(s.event.EventDateTimeDisplay))
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEvent", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvent", err);
        })
    }

    //============= Saves =================

    //============= Other =================
    s.reFop = length => {
        s.eventFOP.reFop(length);
    };


    //Call Functions
    s.getEvent();
}]);