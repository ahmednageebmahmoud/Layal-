ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ', function (s, h, productsServ) {
    s.state = StateEnum;
    s.products = [];
    s.productFOP = {};
    s.productFilter = {
        skip: 0,
        take: 30
    };
    s.newProduct = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getProducts = reset => {

        if (reset) {
          
            s.productFilter.skip = 0;
            s.productFOP = new FOP(lengthWithOutDeleted(s.products));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProducts(s.productFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.products = [];
                    s.products = s.products.concat(d.data.Result);
                    s.productFilter.skip += s.productFilter.take;


                    if (s.productFOP && s.productFOP.paging)
                        s.productFOP = new FOP(lengthWithOutDeleted(s.products), s.productFOP.paging.currentPage,
                            s.productFOP.paging.limitPagesTake,
                            s.productFOP.paging.limitPagesSkip);
                    else
                        s.productFOP = new FOP(lengthWithOutDeleted(s.products));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProducts", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProducts", err);
        })
    };


    //============= Saves =================

    s.changeActive = product => {
        //show confirm 
        SMSSweet.delete(() => {
            //Yes 
            BlockingService.block();
            productsServ.changeActive(product.Id, product.IsActive).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            product.IsActive = product.IsActive
                          
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-changeActive', d.data);
            });
        }, () => { }, LangIsEn?"Are You Shure From This":"هل انت متاك من ذالك؟");
    };

    //============= Delete ================
    s.delete = product => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            product.State = StateEnum.delete;
            BlockingService.block();
            productsServ.saveChange(product).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.products.splice(s.products.findIndex(c => c.Id == product.Id), 1)
                            s.reFop(s.products.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    
 
 



    //============= Other =================
    s.reFop = length => {
        s.productFOP.reFop(length);
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
    s.getProducts();
}]);