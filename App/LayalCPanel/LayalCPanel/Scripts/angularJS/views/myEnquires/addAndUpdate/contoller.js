ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    //Fill Current Date
    var currentDate = new Date();
    var currentDay = currentDate.getDate(), currentMonth = currentDate.getMonth() + 1, currentYear = currentDate.getFullYear();
    s.dateCond = {
        minDay: 0,
        maxDay: 0,
        minMonth: 0,
        maxMonth: 12,
    };s
    s.state = StateEnum;
    s.enquires = [];
    s.enquiyFOP = {};
    var accountTypeId = getQueryStringValue("q");
    s.enquiry = {
        State: StateEnum.create,
        EnquiryTypeId: accountTypeId,
        CountryId: null,
        CityId: null,
        BranchId: null,
        PhoneCountryId:null
    };

    s.countries = [{
        Id: null,
        CountryName: Token.select,
        CountryNameIsoCode: Token.select,
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId: null
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



    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.enquiyFormSubmitErro = true;
            return;
        }

        s.enquiyFormSubmitErro = false;
        BlockingService.block();
        enquiresServ.saveChange(s.enquiry).then(d => {
         

            setTimeout(() => {
                $("select[serchbale]").select2();
            }, 1000)

            BlockingService.unBlock();
                    SMSSweet.alert(d.data.Message, d.data.RequestType)

            co("G E T - saveChange", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        });
    };

    //============= Other =================
    s.reFop = length => {
        s.enquiyFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };

    s.cultDateCondetion = () => {
        //Day Min And Month
        if (s.enquiry.Year > currentYear) {
            s.dateCond.minMonth = 1;
            s.dateCond.minDay = 1;
        }
        else {
            s.dateCond.minMonth = currentMonth;
            s.dateCond.minDay = currentDay;
        }

        // Max Day
        switch (s.enquiry.Month) {
            case 2:
                {
                    if (s.enquiry.Year % 4 == 0)
                        s.dateCond.maxDay = 29;
                    else
                        s.dateCond.maxDay = 28;
                } break;
                //    case 1: case 3: case 5: case 7: case 8: case 10: case 12: return 31;
            case 4: case 6: case 9: case 11: s.dateCond.maxDay = 30; break;
            default: s.dateCond.maxDay = 31; break;
        }
    }

    s.gotoUrl = url=> {
        window.location.href = url;
    };


    //Call Functions
    s.getItems();
    s.cultDateCondetion();
}]);