ngApp.controller('staticFieldsCtrl', ['$scope', '$http', 'staticFieldsServ', function (s, h, staticFieldsServ) {
    s.state = StateEnum;
    s.staticFields = [];
    s.staticFieldFOP = {};
    s.staticFieldFilter = {
        skip: 0,
        take: 30
    };
    s.newStaticField = {
        NameAr: null,
        NameEn: null,
        State: StateEnum.create
    }




    //============= G E T =================
    s.getStaticFields = reset => {

        if (reset) {

            s.staticFieldFilter.skip = 0;
            s.staticFieldFOP = new FOP(lengthWithOutDeleted(s.staticFields));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        staticFieldsServ.getStaticFields(s.staticFieldFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset)
                        s.staticFields = [];
                    s.staticFields = s.staticFields.concat(d.data.Result);
                    s.staticFieldFilter.skip += s.staticFieldFilter.take;


                    if (s.staticFieldFOP && s.staticFieldFOP.paging)
                        s.staticFieldFOP = new FOP(lengthWithOutDeleted(s.staticFields), s.staticFieldFOP.paging.currentPage,
                            s.staticFieldFOP.paging.limitPagesTake,
                            s.staticFieldFOP.paging.limitPagesSkip);
                    else
                        s.staticFieldFOP = new FOP(lengthWithOutDeleted(s.staticFields));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getStaticFields", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getStaticFields", err);
        })
    };


    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.staticFieldFrmErrorSubmit = true;
            return;
        }
        s.staticFieldFrmErrorSubmit = false;
        BlockingService.block();
        staticFieldsServ.saveChange(s.newStaticField).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        if(s.newStaticField.State==StateEnum.update)
                            s.staticFields[s.staticFields.findIndex(c=> c.Id == s.newStaticField.Id)]=s.newStaticField;
                        else
                        {
                        s.staticFields.push(d.data.Result);
                            s.reFop();
                        }

                        s.resetForm();
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
    s.delete = staticField => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            staticField.State = StateEnum.delete;
            BlockingService.block();
            staticFieldsServ.saveChange(staticField).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.staticFields.splice(s.staticFields.findIndex(c => c.Id == staticField.Id), 1)
                            s.reFop(s.staticFields.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    s.update = staticField => {
        if (!staticField) return;

        //Move To Top For Update
        KTUtil.scrollTop();

        //Add Class Flash To Form 
        animatedElement('[name="addStaticFieldFrm"]');

        s.newStaticField = angular.copy(staticField);
        s.newStaticField.State = StateEnum.update;
    };







    //============= Other =================

    s.resetForm = () => {
        s.staticFieldFrmErrorSubmit = false;
        s.newStaticField = {
            NameAr: null,
            NameEn: null,
            State: StateEnum.create
        }
    }

    s.reFop = length => {
        s.staticFieldFOP.reFop(length);
    };

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
    s.getStaticFields();
}]);