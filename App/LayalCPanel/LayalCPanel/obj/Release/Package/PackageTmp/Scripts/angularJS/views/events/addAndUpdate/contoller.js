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
        Package: null,
        IsActive:true
    };

    s.packages = [];

    s.printNameTypes = [];


    //============= G E T =================
    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.packages = s.packages.concat(d.data.Result.Packages);
                    s.printNameTypes = s.printNameTypes.concat(d.data.Result.PrintNameTypes);
                    s.fillPackage(s.event.PackageId);

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
                    s.event = d.data.Result;
                    s.event.State = StateEnum.update;
                    s.event.EventDateTime = new Date(Date.parse(s.event.EventDateTimeDisplay))
                    s.event.VistToCoordinationDateTime = new Date(Date.parse(s.event.VistToCoordinationDateTimeDisplay))
                    
                    s.fillPackage(s.event.PackageId);

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
            co("G E T - getEvent", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvent", err);
        })
    }

    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.eventFormSubmitErro = true;
            return;
        }
        s.eventFormSubmitErro = false;
        BlockingService.block();
        eventsServ.saveChange(s.event).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.event.State = StateEnum.update;
                    s.event.Note = null;
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
        s.eventFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };


    //check from input language
    s.$watch('event.NameGroom', (newVal, oldVal) => {
        if (!newVal) return;
        //التحقق من اختيار اللغة المختارة فـ اذاكانت عربقى فيجب ان يدخل عربى والعكس 
        if (s.event.IsNamesAr) {
            if (!checkInputRTL(newVal[newVal.length - 1]))
                s.event.NameGroom = oldVal;
        } else {
            if (checkInputRTL(newVal[newVal.length - 1]))
                s.event.NameGroom = oldVal;
        }
    });

    //check from input language
    s.$watch('event.NameBride', (newVal, oldVal) => {
        if (!newVal) return;
        //التحقق من اختيار اللغة المختارة فـ اذاكانت عربقى فيجب ان يدخل عربى والعكس 
        if (s.event.IsNamesAr) {
            if (!checkInputRTL(newVal[newVal.length - 1]))
                s.event.NameBride = oldVal;
        } else {
            if (checkInputRTL(newVal[newVal.length - 1]))
                s.event.NameBride = oldVal;
        }
    });

    s.uplaodLogo = file=> {
        s.event.LogoFileName = file.name;
        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.event.CustomLogo = d.target.result;
        }
    };


    //تغير الباكج
    s.fillPackage = (packageId) => {

        s.event.Package = s.packages[s.packages.findIndex(c=> c.Id == packageId)];
        if (!s.event.Package) return;

        s.event.PackagePrice = s.event.Package.Price;
        s.event.PackageNamsArExtraPrice = 0;
    }

    //تغير حالة طباعة الاسماء
    s.changeIsNameAr = isNamesAr=> {
        s.event.NameGroom = null;
        s.event.NameBride = null;
        if (isNamesAr)
            s.event.PackageNamsArExtraPrice = s.event.Package.NamsArExtraPrice;
        else
            s.event.PackageNamsArExtraPrice = 0;


    }


    //Call Functions
    s.getItems();
    s.getEvent();
}]);