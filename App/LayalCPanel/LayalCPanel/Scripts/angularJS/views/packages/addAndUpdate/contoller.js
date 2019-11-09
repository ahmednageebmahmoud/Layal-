
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
    s.package = {
        AlbumTypeId: null
    };
    s.packageDeail = {};
    s.packageOpration = {};
    s.packageItemOpration = {};
    s.package.Id = getQueryStringValue('id');



    //============= G E T =================
    s.getPackageById = () => {
        if (!s.package.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        packagesServ.getPackageById(s.package.Id).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.package = d.data.Result;
                    s.package.State = StateEnum.update;

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
        if(  s.package.State != StateEnum.update)
        s.package.State = StateEnum.create;

        if (!s.packages)
            s.packages = [];


        //Save
        BlockingService.block();
        packagesServ.saveChangePackage(s.package).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.package = d.data.Result;
                        s.package.NamsArExtraPrice = s.package.NamsArExtraPrice || null;
                        s.package.State = StateEnum.update;

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
        newItem.PackageId = s.package.Id;
        //Save
        BlockingService.block();
        packagesServ.saveChangePackageDeail(newItem).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        newItem.Id = d.data.Result.Id;
                        newItem.State = StateEnum.update;
                        packag.PackageDetails.push(angular.copy(newItem));
                        s.packageDeail = { PackageId: s.package.Id };
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



    //============= U P D A T E  =================
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
                            s.package.PackageDetails.splice(s.package.PackageDetails.findIndex(c => c.Id == packag.Id), 1)
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