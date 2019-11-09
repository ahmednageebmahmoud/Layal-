ngApp.controller('productTypesCtrl', ['$scope', '$http', 'productTypesServ', function (s, h, productTypesServ) {
    s.state = StateEnum;
    s.productTypes = [];
    s.productTypeFOP = {};
    s.productTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newProductType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getProductTypes = reset => {

        if (reset) {
          
            s.productTypeFilter.skip = 0;
            s.productTypeFOP = new FOP(lengthWithOutDeleted(s.productTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        productTypesServ.getProductTypes(s.productTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.productTypes = [];
                    s.productTypes = s.productTypes.concat(d.data.Result);
                    s.productTypeFilter.skip += s.productTypeFilter.take;


                    if (s.productTypeFOP && s.productTypeFOP.paging)
                        s.productTypeFOP = new FOP(lengthWithOutDeleted(s.productTypes), s.productTypeFOP.paging.currentPage,
                            s.productTypeFOP.paging.limitPagesTake,
                            s.productTypeFOP.paging.limitPagesSkip);
                    else
                        s.productTypeFOP = new FOP(lengthWithOutDeleted(s.productTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProductTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProductTypes", err);
        })
    };


    //============= Saves =================

    

    //============= Delete ================
    s.delete = productType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            productType.State = StateEnum.delete;
            BlockingService.block();
            productTypesServ.saveChange(productType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.productTypes.splice(s.productTypes.findIndex(c => c.Id == productType.Id), 1)
                            s.reFop(s.productTypes.length);
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
        s.productTypeFOP.reFop(length);
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
    s.getProductTypes();
}]);