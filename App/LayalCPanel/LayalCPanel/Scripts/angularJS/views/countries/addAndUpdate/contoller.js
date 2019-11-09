
ngApp.controller('addAUpdateCountriesCtrl', ['$scope', '$http', 'addAUpdateCountriesServ', function (s, h, countrysServ) {
    s.state = StateEnum;
    s.skip = 0;
    s.take = Defaults.takeFromServer;
    s.countryErrorEdting = false;
    s.countryFrmErrorSubmit = false;

    //معرف الاوبجكت الذى يريد المستخدم التعديل فية
    s.itemEditId = 0;
    //نسخة من الوجكيت الذى يعدل فية المستخدم تكون احطياتى اذا قاام بـ الغاء التعديل
    s.countryItemEditBackup = {};
    s.countrys = [];

    //Countries Items
    s.newCountryDefault = {
        NameAr: null,
        NameEn: null
    };
    s.newCountry = s.newCountryDefault;
    s.newCity = {};
    s.countryOpration = {};
    s.countryItemOpration = {};
    s.newCountry.Id = getQueryStringValue('id');



    //============= G E T =================
    s.getCountryById = () => {
        if (!s.newCountry.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        countrysServ.getCountryById(s.newCountry.Id).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newCountry = d.data.Result;
                    s.newCountry.State = StateEnum.update;

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getCountries", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getCountryById", err);
        })
    };


    //============= A D D - N E W =================
    s.countryOpration.saveChange = form => {
        if (form.$invalid) {
            s.countryFrmErrorSubmit = true;
            return;
        }
        s.countryFrmErrorSubmit = false;
        if(  s.newCountry.State != StateEnum.update)
        s.newCountry.State = StateEnum.create;

        if (!s.countrys)
            s.countrys = [];


        //Save
        BlockingService.block();
        countrysServ.saveChangeCountry(s.newCountry).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.newCountry.Id = d.data.Result.Id;
                        s.newCountry.State = StateEnum.update;

                    } break;
            }
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);


            co('res-savechnage-add', d.data);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co('country save chaqnge-add', err);
        });
    };

    //اضافة عنصر جديد لـ قائمة العناصر الخاصة بمجموعة معينة
    s.countryItemOpration.addNew = (newItem, country) => {
        if (!newItem || !country) return;

        if (!Array.isArray(country.Cities))
            country.Cities = [];

        newItem.NameArIsRequired = false;
        newItem.NameArIsMaxlength = false;
        newItem.NameEnIsRequired = false;
        newItem.NameEnIsMaxlength = false;

        if (s.propertyIsFalthy(newItem.NameAr))
            newItem.NameArIsRequired = true;
        else if (s.propertyIsMaxLength(newItem.NameAr, 50))
            newItem.NameArIsMaxlength = true

        if (s.propertyIsFalthy(newItem.NameEn))
            newItem.NameEnIsRequired = true;
        else if (s.propertyIsMaxLength(newItem.NameEn, 50))
            newItem.NameEnIsMaxlength = true;


        if (newItem.NameArIsRequired ||
            newItem.NameArIsMaxlength ||
            newItem.NameEnIsRequired ||
            newItem.NameEnIsMaxlength) {
            s.erroAddNewItem = true;
            return;
        }

        //change state
        newItem.State = StateEnum.create;
        newItem.CountryId = s.newCountry.Id;
        //Save
        BlockingService.block();
        countrysServ.saveChangeCity(newItem).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        newItem.Id = d.data.Result.Id;
                        newItem.State = StateEnum.update;
                        country.Cities.push(angular.copy(newItem));
                        s.newCity = { CountryId: s.newCountry.Id };
                    } break;
            }
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);

            co('res-savechnage-add-item', d.data);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co('country save chaqnge-add-item', err);
        });

    };



    //============= U P D A T E  =================
    //change row for edit 
    s.countryItemOpration.changeEdit = country => {
        if (!country) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.countryItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = country.Id;
        //save object editing in temp for replace if usre cancel edit
        s.countryItemEditBackup = angular.copy(country);
    };

    //cancel edit
    s.countryItemOpration.cancelEdit = () => {
        debugger;
        s.newCountry.Cities[s.newCountry.Cities.findIndex(c => c.Id == s.itemEditId)] = s.countryItemEditBackup;
        s.itemEditId = null;
        s.countryItemEditBackup = null;
    };

    //Save Edit
    s.countryItemOpration.saveEdit = countryItem => {
        countryItem = countryItem || s.countrys[s.newCountry.Cities.findIndex(c => c.Id == s.itemEditId)];

        if (!countryItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(countryItem.NameAr)) {
            countryItem.NameArIsIsRequierd = true;
            s.countryErrorEdting = true;
            return;
        } else if (countryItem.NameAr.length > 50) {
            countryItem.NameArIsIsMaxlength = true;
            s.countryErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(countryItem.NameEn)) {
            countryItem.NameEnIsIsRequierd = true;
            s.countryErrorEdting = true;
            return;
        } else if (countryItem.NameEn.length > 50) {
            countryItem.NameEnIsIsMaxlength = true;
            s.countryErrorEdting = true;
            return;
        }

        countryItem.State = StateEnum.update;
        BlockingService.block();
        countrysServ.saveChangeCity(countryItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.countryItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };


    s.countryOpration.saveEdit = (form, country) => {
        if (form.$invalid) {
            s.countryFrmErrorSubmit = true;
            return;
        }
        s.countryFrmErrorSubmit = false;
        country.State = StateEnum.update;
        BlockingService.block();
        countrysServ.saveChangeCountry(country).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);

            co('res-savechnage-edit', d.data);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co('country save chaqnge-edit', err);
        });
    };

    //============= D E L E T E =================
    s.countryItemOpration.delete = country => {
        //show confirm delete
        SMSSweet.delete(() => {
            country.State = StateEnum.delete;
            //is approve must be deleted
            BlockingService.block();
            countrysServ.saveChangeCity(country).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.newCountry.Cities.splice(s.newCountry.Cities.findIndex(c => c.Id == country.Id), 1)
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-delete-item', d.data);
            })
        });
    };






    //============= Other =================

    //للتحقق القيم المطلوبة
    s.propertyIsFalthy = (prop, propChange) => {
        propChange = !prop;
        return !prop;
    }
    //للتحقق من عدد القيم المدخلة 
    s.propertyIsMaxLength = (prop, mxLength) => {
        if (!prop) return;
        return prop.length > mxLength;

    };

    //Call Functions
    s.getCountryById();
}]);