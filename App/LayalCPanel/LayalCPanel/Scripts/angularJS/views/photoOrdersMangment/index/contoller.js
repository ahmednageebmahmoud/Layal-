
ngApp.controller('ordersCtrl', ['$scope', '$http', 'ordersServ', function (s, h, ordersServ) {
    s.state = StateEnum;
    s.orders = [];
    s.orderFOP = {};
    s.orderFilter = {
        skip: 0,
        take: 30,
        productTypeId:null,
        productId: null,
        userCreatedId: null,
        createDateFrom:null,
        createDateTo: null,
        isActive:null
    };
    s.productTypes = [{ Id: null, ProductTypeName: Token.select }];
    s.photographers = [{ Id: null, Name: Token.select }];
    s.products = [{ Id: null, ProductName: Token.select }];
    s.statusList = [{ Id: null, Name: Token.select },
        { Id: true, Name: Token.active },
        { Id: false, Name: Token.unActive },
    ]


    //============= G E T =================
    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();
        ordersServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.productTypes = [...s.productTypes,...d.data.Result.ProductTypes];
                    s.photographers = [...s.photographers,...d.data.Result.Photographers];
                    selectTo();
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

    s.getProductsByProductTypeId = productTypeId => {
        s.products = [{ Id: null, ProductName: Token.select }];
        if (!productTypeId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        ordersServ.getProductsByProductTypeId(productTypeId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.products = [...s.products,...d.data.Result.Products];
                    selectTo();
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

    //Add New Payment
    s.addNewPayment = form => {
        if (form.$invalid) {
            s.addPaymrntFrmSubmitErro = true;
            return;
        }

        ordersServ.addNewPayment(s.newPayment).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        bootstrapModelHide("addNewPayment");
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - addNewPayment", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - addNewPayment", err);
        })

    }

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
    s.cancel = order => {
        //show confirm cancele
        SMSSweet.confirmInfo(Token.areYouSureCancel, () => {
            //Yes Cancel
            order.State = StateEnum.cancel;

            BlockingService.block();
            ordersServ.saveChange(order).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            order.IsActive = 0;
                            order.UserCancleddId = d.data.Result.UserId;
                            order.UserCancled.Name = d.data.Result.UserName;
                            order.UserCancled.CancledDateTime_Display = d.data.Result.CancledDateTime_Display;
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-cancel', d.data);
            });
        });

    };
    
 
 



    //============= Other =================
    s.reFop = length => {
        s.orderFOP.reFop(length);
    };


    //Show Model For Add New Payment
    s.showAddNewPayment = orderId => {
        s.newPayment = { OrderId: orderId };

        s.addPaymrntFrmSubmitErro = false;
        bootstrapModelShow("addNewPayment");
    };


    //Call Functions
    s.getOrders();
    s.getItems();
}]);