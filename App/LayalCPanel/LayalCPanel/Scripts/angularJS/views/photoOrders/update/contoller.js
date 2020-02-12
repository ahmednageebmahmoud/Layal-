ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ', '$rootScope', function (s, h, productsServ, rs) {
    s.state = StateEnum;
    s.order = {
        Id: getQueryStringValue('id'),
    };

    s.product = { Options: [] };
    s.newOptionItem = {};
    s.cities = [{ Id: null, CityNameWithShippingPrice: Token.select }];
    s.countries = [{ Id: null, CountryName: Token.select }];



    //============= G E T =================
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
                        if (s.order.Options)
                            c.ProductOptionItemSelectedId = s.order.Options.find(o => o.Id == c.Id).ProductOptionItemSelectedId;
                    });
                    s.getCities(true);
                    s.sumTotalPrices();
                    s.getProductsByProductTypeId(s.order.ProductTypeId, true);
                    s.autosize();
                    s.order.State = StateEnum.update;
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getOrder", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getOrder", err);
        })
    };

    s.getProductsByProductTypeId = (productTypeId, isFirstTime) => {
        //Check If This First Time
        if (!isFirstTime) {

            //Got To Next Step
            $('[data-ktwizard-type="action-next"]').click();

            //Reset Product Id
            s.order.ProductId = null;
        }

        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProductsByProductTypeId(productTypeId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.products = d.data.Result.Products;
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

    //get Items
    s.getItems = reset => {

        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.productTypes = d.data.Result.ProductTypes;
                    s.countries = [...s.countries, ...d.data.Result.Countries];
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

    //get Cities
    s.getCities = isFirstTime => {
        if (!isFirstTime)    s.order.Delivery_CityId = null;
        s.cities = [{ Id: null, CityNameWithShippingPrice: Token.select }];
        if (!s.order.Delivery_CountryId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getCities(s.order.Delivery_CountryId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.cities = [...s.cities, ...d.data.Result.Cities];
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

    //get Product Details
    s.getProductDetails = productId => {
        //Got To Next Step
        $('[data-ktwizard-type="action-next"]').click();
        s.order.Product = {};
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProductDetails(productId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.order.Product = d.data.Result;

                    //Add New 'Select' Option
                    if (s.order.Product.Options) {
                        s.order.Product.Options.forEach(op => {
                            if (op.Items)
                                op.Items.push({ Id: null, Value: Token.select });
                        });
                    }

                    setTimeout(() => {
                        s.autosize();
                    }, 3000)
                    selectTo();
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProductDetails", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProductDetails", err);
        })
    };



    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid || !s.order.ProductTypeId || s.order.Files.filter(c => c.State != StateEnum.delete).length == 0 || s.order.Options.length < s.order.Product.Options.length) {
            s.productFrmErrorSubmit = true;
            return;
        }
        s.productFrmErrorSubmit = false;

        BlockingService.block();
        productsServ.saveChange(s.order).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.order.Files = d.data.Result;
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
    s.deleteFile = file => {
        file.State = StateEnum.delete;
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //Uplaod Images
    s.uplaodImages = files => {
        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.order.Files.length < 10) {
                    s.order.Files.push({
                        State: StateEnum.create
                        ,
                        File: file,
                        ImageUrl: d.target.result
                    });
                    s.$apply();
                }
            }
        }

    }

    //تحديث العناصر المختارة
    s.selectOptionItem = () => {
        //Fill Options And Item Selected
        s.order.Options = s.order.Product.Options.filter(c => c.ProductOptionItemSelectedId).map(c => {
            let optionTarget = angular.copy(c);
            optionTarget.ItemSelected = c.Items.find(v => v.Id == optionTarget.ProductOptionItemSelectedId);
            optionTarget.Items = [];
            optionTarget.State = StateEnum.create;
            return optionTarget;
        });
        //Updatet Service Prices
        s.updateServicePrices();
    }

    //تحديث مصاريف خدمة التوصيل
    s.updateDeliveryServicePrice = cityId => {
        let citySelected = s.cities.find(c => c.Id == cityId);
        if (!citySelected) {
            s.order.DeliveryServicePrice = 0;
            return;
        }
        s.order.DeliveryServicePrice = citySelected.ShippingPrice;

        //Updatet Service Prices
        s.updateServicePrices();
    }

    //Updatet Service Prices
    s.updateServicePrices = () => {
        //Rest Prices
        s.order.ServicePrices = [];
        //Add Options Prices
        s.order.Options.forEach(option => {
            s.order.ServicePrices.push({
                ServiceName: option.ItemSelected.Value,
                Price: option.ItemSelected.Price,
                CreateDateTime_Display: Token.now
            });
        });

        //Add   Delivery Service  Price
        s.order.ServicePrices.push({
            ServiceName: Token.deliveryService,
            Price: s.order.DeliveryServicePrice||0,
            CreateDateTime_Display: Token.now
        });

        //Update Total Price
        s.sumTotalPrices();
    };

    //Sum Total Price For Order
    s.sumTotalPrices = () => {
        s.order.TotalPrices = 0;
        s.order.ServicePrices.forEach(o => {
            s.order.TotalPrices += o.Price;
        });
    }

    //Cnahge  ReceiptFromTheBranch
    s.checkDelivery_IsReceiptFromTheBranch = () => {
        if (s.order.Delivery_IsReceiptFromTheBranch) {
            s.order.Delivery_CountryId = null;
            s.order.Delivery_CityId = null;
            s.order.Delivery_Address = null;
            s.order.DeliveryServicePrice = 0;
        }

        //Reselect
        selectTo();

        //Update Service Prices
        s.updateServicePrices();
    }


    //Autosize
    s.autosize = () => {
        var demo1 = $('[autosize]');
        autosize(demo1);
        autosize.update(demo1);
    };

    //Redesign
    s.redesign = () => {
        selectTo();
        s.autosize();
    }

    //Call Functions
    s.getItems();
    s.getOrder();
}]);