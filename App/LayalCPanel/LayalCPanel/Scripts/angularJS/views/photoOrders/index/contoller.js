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

    

    //Add New Payment
    s.addNewPayment = form => {
        if (form.$invalid || !s.newPayment.File) {
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
    //============= U P D A T E  =================
    s.cancel = order => {
        //show confirm cancele
        SMSSweet.confirmInfo(Token.areYouSureCancel, () => {
            //Yes Delete
            order.State = StateEnum.cancel;
            BlockingService.block();
            ordersServ.saveChange(order).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            order.IsActive = 0;
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-cancel', d.data);
            });
        });

    };
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
                            s.orders.splice(s.orders.findIndex(c => c.Id == order.Id), 1);
                            s.reFop(s.orders.length);

                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-Delete', d.data);
            });
        });

    };

    
    
 
 



    //============= Other =================

    //رفع صورة الحوالة البنكية 
    s.uplaodImages = file => {
        if (!file || !file[0]) {
            s.newPayment.File = null;
            return;
        }

        s.newPayment.File = file[0];

        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(file[0]);
        fileReaer.onload = (d) => {
            s.newPayment.BankTransferImage = d.target.result;
            s.$apply();
        }
    };

    //Show Model For Add New Payment
    s.showAddNewPayment = orderId => {
        s.newPayment = { OrderId:orderId};

        s.addPaymrntFrmSubmitErro = false;
        bootstrapModelShow("addNewPayment");
    };

    s.reFop = length => {
        s.orderFOP.reFop(length);
    };

    //Call Functions
    s.getOrders();
}]);