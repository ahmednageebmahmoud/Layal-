ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    var enquiyId = getQueryStringValue("id");
    s.countries = [{
        Id: null,
        CountryName: Token.select
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId: null
    }];
    s.enquiryTypes = [{
        Id: null,
        EnquiryTypeName: Token.select
    }];

    s.branches = [{
        Id: null,
        BranchName: Token.select,
        CityId: null
    }];


    //============= G E T =================
    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        enquiresServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = s.countries.concat(d.data.Result.Countries);
                    s.cities = s.cities.concat(d.data.Result.Cities);
                    s.enquiryTypes = s.enquiryTypes.concat(d.data.Result.EnquiryTypes);;
                    s.branches = s.branches.concat(d.data.Result.Branches);;

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
                    s.event = d.data.Result.Event;
                    s.paymentsInformations = d.data.Result.PaymentsInformations;
                    s.package = d.data.Result.Package;

                    s.enquiry.State = StateEnum.update;

                    setTimeout(() => {
                        $("select[serchbale]").select2();
                    }, 500)

                    if (s.event)
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

    //============= Saves =================
    // s.getItems();
    s.getEnquiy();
}]);