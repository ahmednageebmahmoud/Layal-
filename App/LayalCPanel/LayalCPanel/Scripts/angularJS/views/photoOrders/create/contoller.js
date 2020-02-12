ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ','$rootScope', function (s, h, productsServ,rs) {
    s.state = StateEnum;
    s.newOrder= {
        State: StateEnum.create,
        ProductTypeId:null,
        ProductId: null,
        Files: [],
        Options: [],
        TotalPrices: 0,
        Delivery_CountryId: null,
        Delivery_CityId: null,
       DeliveryServicePrice : 0,

    Product : { Options:[] }

    };
    s.newOptionItem = {};
    s.cities = [{ Id: null, CityNameWithShippingPrice: Token.select }];
    s.countries = [{ Id: null, CountryName: Token.select }];



    //============= G E T =================
    s.getProductsByProductTypeId = productTypeId =>{
        //Got To Next Step
        $('[data-ktwizard-type="action-next"]').click();

        //Reset Product Id
        s.newOrder.ProductId = null;

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

    s.getItems = reset => {
        
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getItems( ).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.productTypes = d.data.Result.ProductTypes;
                    s.countries = [...s.countries,... d.data.Result.Countries];
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
        s.cities = [{ Id: null, CityNameWithShippingPrice: Token.select }];
        s.newOrder.Delivery_CityId = null;
        if (!s.newOrder.Delivery_CountryId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getCities(s.newOrder.Delivery_CountryId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.cities = [...s.cities,...d.data.Result.Cities];
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

    s.getProductDetails = productId => {
        //Got To Next Step
        $('[data-ktwizard-type="action-next"]').click();
        s.newOrder.Product = {};
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProductDetails(productId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newOrder.Product = d.data.Result;

                    //Add New 'Select' Option
                    if (s.newOrder.Product.Options) {
                        s.newOrder.Product.Options.forEach(op => {
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
        if (form.$invalid || !s.newOrder.ProductTypeId || s.newOrder.Files.filter(c => c.State != StateEnum.delete).length == 0 || s.newOrder.Options.length < s.newOrder.Product.Options.length) {
            s.productFrmErrorSubmit = true;
            return;
        }
        s.productFrmErrorSubmit = false;

        BlockingService.block();
        productsServ.saveChange(s.newOrder).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        SMSSweet.confirmInfoV2(d.data.Message,
                            LangIsEn ? "Go To Update Order" : "الانتقال الى صفحة تحديث الطلب",
                            LangIsEn ? "Create new order" : "انشاء طلب جديد",
                            () => {
                            //Go To Update Page
                                window.location.href = `/PhotoOrders/Update?id=${d.data.Result.Id}`;
                        }, () => {
                            //Refrash Page
                            window.location.reload();
                        });
                    } break;
                default:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }

            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })
    };

    


    //-+-+-+-+-+-+ Delete -+-+-+-++-+++-+-+
    s.deleteFile = index => {
            s.newOrder.Files.splice(index, 1)
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //تحديث العناصر المختارة
    s.selectOptionItem = () => {
        //Fill Options And Item Selected
        s.newOrder.Options = s.newOrder.Product.Options.filter(c => c.ProductOptionItemSelectedId).map(c => {
            let optionTarget = angular.copy(c);
            optionTarget.ItemSelected = c.Items.find(v => v.Id == optionTarget.ProductOptionItemSelectedId);
            optionTarget.Items = [];
            return optionTarget;
        });
        //Updatet Service Prices
        s.updateServicePrices();
    }

    //تحديث مصاريف خدمة التوصيل
    s.updateDeliveryServicePrice = cityId => {
        let citySelected = s.cities.find(c => c.Id == cityId);
        if (!citySelected) {
            s.newOrder.DeliveryServicePrice = 0;
        return;
        }
        s.newOrder.DeliveryServicePrice = citySelected.ShippingPrice;

        //Updatet Service Prices
        s.updateServicePrices();
    }

    //Updatet Service Prices
    s.updateServicePrices = () => {

        //Rest Prices
        s.newOrder.ServicePrices = [];
        //Add Options Prices
        s.newOrder.Options.forEach(option => {
            s.newOrder.ServicePrices.push({
                ServiceName: option.ItemSelected.Value,
                Price: option.ItemSelected.Price,
                CreateDateTime_Display: Token.now
            });
        });

        //Add   Delivery Service  Price
        s.newOrder.ServicePrices.push({
            ServiceName: Token.deliveryService,
            Price: s.newOrder.DeliveryServicePrice,
            CreateDateTime_Display: Token.now
        });

        //Update Total Price
        s.sumTotalPrices();
    };

    //Uplaod Images
    s.uplaodImages = files => {
        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.newOrder.Files.length < 10) {
                    s.newOrder.Files.push({
                        State: StateEnum.create,
                        File: file,
                        ImageUrl: d.target.result
                    });
                    s.$apply();
                }
            }
        }

    }

    //Sum Total Price For Order
    s.sumTotalPrices = () => {
        s.newOrder.TotalPrices = 0;
        s.newOrder.ServicePrices.forEach(o => {
            s.newOrder.TotalPrices += o.Price;
        });
    }

    //Cnahge  ReceiptFromTheBranch
    s.checkDelivery_IsReceiptFromTheBranch = () => {
        if (s.newOrder.Delivery_IsReceiptFromTheBranch) {
            s.newOrder.Delivery_CountryId = null;
            s.newOrder.Delivery_CityId = null;
            s.newOrder.Delivery_Address = null;
        s.newOrder.DeliveryServicePrice = 0;
        }
        else
            s.newOrder.TotalPrices = 0;

        //Reselect
        selectTo();
        //Update Service Prices
        s.updateServicePrices();
    }

    s.autosize = () => {
        var demo1 = $('[autosize]');
        autosize(demo1);
        autosize.update(demo1);
    };

    s.redesign=()=>{
        selectTo();
        s.autosize();
    }

    //Call Functions
    
    s.getItems();
}]);