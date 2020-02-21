
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
                    if (s.order.CancleRequests.length > 0)
                        s.order.CancleRequests[s.order.CancleRequests.length - 1].ShowDetails = true;
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
            BlockingService.block();
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

    //Cancle Request Decision
    s.cancleRequestDecisionSave = form => {
        if (form.$invalid) {
            s.cancleRequestDecisionFrmSubmitErro = true;
            return;
        }

        //التحقق من رفع الصورة
        if (!s.cancleRequestDecision.IsRemainingAmountsForCustomer &&
            s.cancleRequestDecision.Customer_IsAccepted &&
            !s.cancleRequestDecision.TransfaerAmpuntImageFile) {

            SMSSweet.alert(
                LangIsEn ?"Please transfer and upload the bank transfer photo":"الرجاء التحويل ورفع صورة الحوالة البنكية"
                , RequestTypeEnum.error);
            return;
        }

        BlockingService.block();
        productsServ.cancleRequestDecision(s.cancleRequestDecision).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        d.data.Result.ShowDetails = true;
                        s.order.CancleRequests[s.order.CancleRequests.findIndex(c => c.Id == s.cancleRequestDecision.Id)] = d.data.Result;
                        bootstrapModelHide("cancleRequestDecision");
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - cancleRequestDecisionSave", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - cancleRequestDecisionSave", err);
        })

    };

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

    //Show Make Decision On Cancle Request
    s.showCancleRequestDecision = cancleRequest => {
        s.cancleRequestDecision = { ...cancleRequest };
        s.cancleRequestDecisionFrmSubmitErro = false;
        bootstrapModelShow("cancleRequestDecision");
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

    //Uplaod For Accept Cancle Request
    s.cancleRequestDecisionImage = files => {
        var fileReaer = new FileReader();
        let file = files[0];
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.cancleRequestDecision.TransfaerAmpuntImage = d.target.result;
            s.cancleRequestDecision.TransfaerAmpuntImageFile = file;
            s.$apply();
        }
    }

    //Go To Spcifc Tap 
    $(document).ready(() => {
    document.getElementById(getQueryStringValue("go").toLocaleLowerCase()).click();
});

//Call Functions
s.getOrder();
}]);