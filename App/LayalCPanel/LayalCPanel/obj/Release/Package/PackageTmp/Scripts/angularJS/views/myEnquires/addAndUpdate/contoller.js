ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    s.state = StateEnum;
    s.enquires = [];
    s.enquiyFOP = {};
    var enquiyId = getQueryStringValue("id");
    s.enquiry = {
        Id: enquiyId,
        State: enquiyId ? StateEnum.update : StateEnum.create,
      
        EnquiryTypeId: null,
        CountryId: null,
        CityId: null,
        BranchId:null,
  
    };

    s.countries = [{
        Id: null,
        CountryName: Token.select
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId:null
    }];
    s.enquiryTypes = [{
        Id: null,
        EnquiryTypeName: Token.select
    }];

    s.branches = [{
        Id: null,
        BranchName: Token.select,
        CityId:null
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

    s.fillDayMax = month=> {
        switch (month) {
            case 2:
                return 29;
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
        }
    };


    s.gotoUrl = url=> {
        window.location.href = url;
    };


    //Call Functions
   // s.getItems();
    s.getEnquiy();
}]);