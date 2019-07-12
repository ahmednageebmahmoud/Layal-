
ngApp.controller('addAUpdatePackagesCtrl', ['$scope', '$http', 'addAUpdatePackagesServ', function (s, h, packagesServ) {
    s.state = StateEnum;
    s.skip = 0;
    s.take = Defaults.takeFromServer;
    s.packageErrorEdting = false;
    s.packageFrmErrorSubmit = false;

    //معرف الاوبجكت الذى يريد المستخدم التعديل فية
    s.itemEditId = 0;
    //نسخة من الوجكيت الذى يعدل فية المستخدم تكون احطياتى اذا قاام بـ الغاء التعديل
    s.packageItemEditBackup = {};
    s.packages = [];

    //Packages Items
    s.newPackage = {
        AlbumTypeId: null
    };
    s.newPackageDeail = {};
    s.packageOpration = {};
    s.packageItemOpration = {};
    s.newPackage.Id = getQueryStringValue('id');



    //============= G E T =================
    s.getPackageById = () => {
        if (!s.newPackage.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        packagesServ.getPackageById(s.newPackage.Id).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newPackage = d.data.Result;
                    s.newPackage.State = StateEnum.update;

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getPackages", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getPackageById", err);
        })
    };

    s.getItems = () => {
        let loading = BlockingService.generateLoding();
        loading.show();
        packagesServ.getItems().then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.albumsTypes = d.data.Result.AlbumsTypes;
                    s.packageInputTypes = d.data.Result.PackageInputTypes;

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

    //============= A D D - N E W =================
    s.packageOpration.saveChange = form =>
    {
        if (form.$invalid) {
            s.packageFrmErrorSubmit = true;
            return;
        }
        s.packageFrmErrorSubmit = false;
        if(  s.newPackage.State != StateEnum.update)
        s.newPackage.State = StateEnum.create;

        if (!s.packages)
            s.packages = [];


        //Save
        BlockingService.block();
        packagesServ.saveChangePackage(s.newPackage).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.newPackage.Id = d.data.Result.Id;
                        s.newPackage.State = StateEnum.update;

                    } break;
            }
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);


            co('res-savechnage-add', d.data);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co('package save chaqnge-add', err);
        });
    };

    //اضافة عنصر جديد لـ قائمة العناصر الخاصة بمجموعة معينة
    s.packageItemOpration.addNew = (newItem, packag) => {
        if (!newItem || !packag) return;

        if (!Array.isArray(packag.PackageDetails))
            packag.PackageDetails = [];

        newItem.PackageInputTypeIdIsRequired = false;
        newItem.ValueArIsRequired = false;
        newItem.ValueEnIsRequired = false;

        if (!newItem.PackageInputTypeId)
            newItem.PackageInputTypeIdIsRequired = true;

        if (s.propertyIsFalthy(newItem.ValueAr))
            newItem.ValueArIsRequired = true;
        else if (s.propertyIsMaxLength(newItem.ValueAr, 50))
            newItem.ValueArIsMaxlength = true;

        if (s.propertyIsFalthy(newItem.ValueEn))
            newItem.ValueEnIsRequired = true;
        else if (s.propertyIsMaxLength(newItem.ValueEn, 50))
            newItem.ValueEnIsMaxlength = true;


        if (newItem.PackageInputTypeIdIsRequired ||
            newItem.ValueArIsRequired ||
            newItem.ValueArIsMaxlength ||
            newItem.ValueEnIsRequired ||
            newItem.ValueEnIsMaxlength) {
            s.erroAddNewItem = true;
            return;
        }

        //change state
        newItem.State = StateEnum.create;
        newItem.PackageId = s.newPackage.Id;
        //Save
        BlockingService.block();
        packagesServ.saveChangePackageDeail(newItem).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        newItem.Id = d.data.Result.Id;
                        newItem.State = StateEnum.update;
                        packag.PackageDetails.push(angular.copy(newItem));
                        s.newPackageDeail = { PackageId: s.newPackage.Id };
                    } break;
            }
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);

            co('res-savechnage-add-item', d.data);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co('package save chaqnge-add-item', err);
        });

    };



    //============= E D I T I  =================
    //change row for edit 
   

     
    //============= D E L E T E =================
    s.packageItemOpration.delete = packag => {
        //show confirm delete
        SMSSweet.delete(() => {
            packag.State = StateEnum.delete;
            //is approve must be deleted
            BlockingService.block();
            packagesServ.saveChangePackageDeail(packag).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.newPackage.PackageDetails.splice(s.newPackage.PackageDetails.findIndex(c => c.Id == packag.Id), 1)
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
    s.getPackageById();
    s.getItems();
}]);