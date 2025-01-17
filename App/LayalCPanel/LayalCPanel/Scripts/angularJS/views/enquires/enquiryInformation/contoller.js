﻿ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    var enquiyId = getQueryStringValue("id");
    s.accountTypeEnum = AccountTypesEnum;
    s.isFromEnquiryPage = getQueryStringValue("q")=='true';

    //============= G E T =================

    //Get Enquires
    s.getEnquiy = () => {
        if (!enquiyId)
            return;

        let loading = BlockingService.generateLoding();
        loading.show();
        enquiresServ.getEnquiy(enquiyId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.enquiry = d.data.Result.Enquiry;
                    s.crm = d.data.Result.CRM;
                    s.event = s.enquiry.Event;
                    s.paymentsInformations = s.enquiry.Payments;
                    s.package = s.event.Package;
                    s.EventTaskStatusIsFinshed =s.event.EventWorkStatusIsFinshed;
                    s.photograohers = s.event.Photographers;
                    s.enquiry.State = StateEnum.update;

                    setTimeout(() => {
                        $("select[serchbale]").select2();
                    }, 500)

                    if (!s.isFromEnquiryPage)
                        document.title = LangIsEn ? "Event Information" : "بيانات المناسبة";

                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEnquiy", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEnquiy", err);
        })
    }

 
    //اغلاق الاستفسار
    s.closeEnquiry = enquiryId=> {
        if (!enquiryId) return;
        SMSSweet.delete(() => {

            BlockingService.block()
            enquiresServ.closeEnquiry(enquiryId).then(d => {
                BlockingService.unBlock();

                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess: {
                        s.enquiry.IsClosed = true;
                        s.enquiry.ClosedDateTimeDisplay = LangIsEn ? 'Now' : 'الان';
                    } break;
                }

                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co("G E T - closeEnquiry", d);
            }).catch(err => {
                BlockingService.unBlock()
                SMSSweet.alert(err.statusText, RequestTypeEnum.error);
                co("E R R O R - closeEnquiry", err);
            })
        },null,LangIsEn?'Ara you sure close this enquiry and following it as payments process and event ?':'هل انت متاكد من اغلاق الاستفسار وكل ما يتتبعة من عمليات دفع والمناسبة ؟');
    }

    s.getEnquiy();
}]);