ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ','$rootScope', function (s, h, productsServ,rs) {
    s.state = StateEnum;
    s.newOrder= {
        State: StateEnum.create,
        ProductTypeId:null,
        ProductId: null,
        Images: [],
        Options: [],
        TotalPrices: 0,
        Delivery_CountryId: null,
        Delivery_CityId:null

    };
    s.product = { Options:[] };
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
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProductDetails(productId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.product = d.data.Result;

                    //Add New 'Select' Option
                    if (s.product.Options) {
                        s.product.Options.forEach(op => {
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
        if (form.$invalid || !s.newOrder.ProductTypeId || s.newOrder.Images.filter(c=> c.State != StateEnum.delete).length == 0 || s.newOrder.Options.length < s.product.Options.length) {
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
                                window.location.href = `/PhotoOrders/Update?id=${d.data.Result.Id}&go=w_payment`;
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
    s.deleteImage = index => {
            s.newOrder.Images.splice(index, 1)
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //تحديث العناصر المختارة
    s.selectOptionItem = () => {
        //Fill Options And Item Selected
        s.newOrder.Options = s.product.Options.filter(c => c.ProductOptionItemSelectedId).map(c => {
            let optionTarget = angular.copy(c);
            optionTarget.ItemSelected = c.Items.find(v => v.Id == optionTarget.ProductOptionItemSelectedId);
            optionTarget.Items = [];
            return optionTarget;
        });
        //Update Total Price
        s.sumTotalPrices();
    }

    //تحديث مصاريف خدمة التوصيل
    s.updateDeliveryServicePrice = cityId => {
        let citySelected = s.cities.find(c => c.Id == cityId);
        if (!citySelected) return;
        s.newOrder.DeliveryServicePrice = citySelected.ShippingPrice;
        //Update Total Price
        s.sumTotalPrices();
    }

    //Uplaod Images
    s.uplaodImages = files => {
        if (s.newOrder.Images.length >= 10) {
            SMSSweet.alert(LangIsEn ? "No more than 10 photos can be downloaded" : "لا يمكن تحميل اكثر من 10 صور", RequestTypeEnum.error);
            return;
        }

        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.newOrder.Images.length < 10) {
                    s.newOrder.Images.push({
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
        s.newOrder.TotalPrices = s.newOrder.DeliveryServicePrice||0;
        s.newOrder.Options.forEach(o => {
            s.newOrder.TotalPrices += o.ItemSelected.Price
        });
    }

    //Cnahge  ReceiptFromTheBranch
    s.checkDelivery_IsReceiptFromTheBranch = () => {
        if (s.newOrder.Delivery_IsReceiptFromTheBranch) {
            s.newOrder.Delivery_CountryId = null;
            s.newOrder.Delivery_CityId = null;
            s.newOrder.Delivery_Address = null;
        }
        else
            s.newOrder.TotalPrices = 0;
        //Update Total Price
        s.sumTotalPrices();
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