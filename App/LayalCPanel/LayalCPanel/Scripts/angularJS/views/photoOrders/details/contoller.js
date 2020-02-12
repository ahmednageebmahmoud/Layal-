
ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ', function (s, h, productsServ) {
    s.state = StateEnum;
    s.order = {
        Id: getQueryStringValue('id'),
    };

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
                    s.autosize();
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





    //============= Saves =================



    //Add New Payment
    s.addNewPayment = form => {
        if (form.$invalid || !s.newPayment.File) {
            s.addPaymrntFrmSubmitErro = true;
            return;
        }
        s.newPayment.OrderId = s.order.Id;
        productsServ.addNewPayment(s.newPayment).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.order.Payments.unshift(d.data.Result);
                        s.order.TotalPayments += s.newPayment.Amount;
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


    //+-+-+-+-+-+-+-+- Other -+-+-+-+-+-+-+-+-
    s.autosize = () => {
        var demo1 = $('[autosize]');
        autosize(demo1);
        autosize.update(demo1);
    };

    //Show Model For Add New Payment
    s.showAddNewPayment = () => {
        s.newPayment = {};
        s.addPaymrntFrmSubmitErro = false;
        bootstrapModelShow("addNewPayment");
    };

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

    //Go To Spcifc Tap 
    $(document).ready(() => {
        document.getElementById(getQueryStringValue("go").toLocaleLowerCase()).click();
    });

    //Call Functions
    s.getOrder();
}]);