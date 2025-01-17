﻿ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    //Fill Current Date
    var currentDate = new Date();
    var currentDay = currentDate.getDate(),
        currentMonth = currentDate.getMonth() + 1, currentYear = currentDate.getFullYear();



    s.state = StateEnum;
    s.dateCond = {
        minDay:0,
        maxDay:0,
        minMonth: 0,
        maxMonth: 12,
    };


    s.enquires = [];
    s.enquiyFOP = {};
    var enquiyId = getQueryStringValue("id");
    s.currentUserInfromation = Auth.userInfromation;
    s.enquiry = {
        Id: enquiyId,
        State: enquiyId ? StateEnum.update : StateEnum.create,
        EnquiryTypeId: null,
        CountryId: s.currentUserInfromation.CountryId||null,
        CityId: s.currentUserInfromation.CityId || null,
        BranchId: s.currentUserInfromation.BrId||null,
        PhoneCountryId: null
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
                    s.enquiry = d.data.Result;
                    s.enquiry.State = StateEnum.update;

                    setTimeout(() => {
                        $("select[serchbale]").select2();
                    }, 500)


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

    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.enquiyFormSubmitErro = true;
            return;
        }

        s.enquiyFormSubmitErro = false;



        BlockingService.block();
        enquiresServ.saveChange(s.enquiry).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.enquiry = d.data.Result;
                    s.enquiry.State = StateEnum.update;
                    s.enquiry.Note = null;
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
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

    s.gotoUrl = url=> {
        window.location.href = url;
    };

    s.cultDateCondetion = () => {
        //Day Min And Month
        if (s.enquiry.Year > currentYear)
        {
            s.dateCond.minMonth=1;
            s.dateCond.minDay = 1;
        }
        else
        {
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
   

    //Call Functions
    s.getItems();
    s.getEnquiy();
    s.cultDateCondetion();
}]);