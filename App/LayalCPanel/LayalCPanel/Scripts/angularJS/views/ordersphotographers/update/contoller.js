ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ', function (s, h, productsServ) {
    s.state = StateEnum;
    s.order = {
        Id: getQueryStringValue('id'),
    };



    




    //============= G E T =================
    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = d.data.Result.Countries;
                    selectTo(1500);
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

    s.getCities = () => {
        s.cities = [];
        if (!s.order.Delivery_CountryId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getCities(s.order.Delivery_CountryId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.cities = d.data.Result.Cities;
                    selectTo();
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getCities", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getCities", err);
        })
    };
    s.getOrder = () => {
        if (!s.order.Id)
            return;

        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getOrder(s.order.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.order = d.data.Result;
                    s.order.Product.Options.forEach(c => {
                        c.ProductOptionItemSelectedId = s.order.Options.find(o=> o.Id==c.Id)  .ProductOptionItemSelectedId ;
                    });
                    s.getCities();

                    s.autosize();
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProductsByProductTypeId", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProductsByProductTypeId", err);
        })
    };

   
    

    
    //============= Saves =================

    s.saveChange = (form) => {
        if (!s.order.ProductTypeId || s.order.Images.filter(c=> c.State != StateEnum.delete).length == 0 || s.order.Options.length < s.product.Options.length) {
            s.productFrmErrorSubmit = true;
            return;
        }
        s.productFrmErrorSubmit = false;

        BlockingService.block();
        productsServ.saveChange(s.order).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.order = d.data.Result;
                        s.order.State = StateEnum.update;
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

    


    //-+-+-+-+-+-+ Delete -+-+-+-++-+++-+-+
    s.deleteImage = index => {
            s.order.Images[index].State = StateEnum.delete;
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    s.selectOptionItem = (option, item) => {
        //Get Options Selectd
        s.order.Options = s.product.Options.filter(c=> c.SelectedItem);
    }

    //Uplaod Images
    s.uplaodImages = files => {
        if (s.order.Images.length >= 10) {
            SMSSweet.alert(LangIsEn ? "No more than 10 photos can be downloaded" : "لا يمكن تحميل اكثر من 10 صور", RequestTypeEnum.error);
            return;
        }

        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.order.Images.length < 10) {
                    s.order.Images.push({
                        State: StateEnum.create,
                        File: file,
                        ImageUrl: d.target.result
                    });
                    s.$apply();
                }
            }
        }

    }

 

    s.autosize = () => {
        var demo1 = $('[autosize]');
        autosize(demo1);
        autosize.update(demo1);
    };

    //Call Functions
    s.getItems();
    s.getOrder();
}]);