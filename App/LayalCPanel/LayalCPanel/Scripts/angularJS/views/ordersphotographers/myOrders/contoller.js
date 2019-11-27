ngApp.controller('ordersCtrl', ['$scope', '$http', 'ordersServ', function (s, h, ordersServ) {
    s.state = StateEnum;
    s.orders = [];
    s.orderFOP = {};
    s.orderFilter = {
        skip: 0,
        take: 30
    };
    s.newOrder = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getOrders = reset => {
        if (reset) {
          
            s.orderFilter.skip = 0;
            s.orderFOP = new FOP(lengthWithOutDeleted(s.orders));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        ordersServ.getOrders(s.orderFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.orders = [];
                    s.orders = s.orders.concat(d.data.Result);
                    s.orderFilter.skip += s.orderFilter.take;


                    if (s.orderFOP && s.orderFOP.paging)
                        s.orderFOP = new FOP(lengthWithOutDeleted(s.orders), s.orderFOP.paging.currentPage,
                            s.orderFOP.paging.limitPagesTake,
                            s.orderFOP.paging.limitPagesSkip);
                    else
                        s.orderFOP = new FOP(lengthWithOutDeleted(s.orders));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getOrders", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getOrders", err);
        })
    };


    //============= Saves =================

    

    //============= Delete ================
    s.delete = order => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            order.State = StateEnum.delete;
            BlockingService.block();
            ordersServ.saveChange(order).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.orders.splice(s.orders.findIndex(c => c.Id == order.Id), 1)
                            s.reFop(s.orders.length);
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
        s.orderFOP.reFop(length);
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
    s.getOrders();
}]);