
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
                        s.order.CancleRequests[s.order.CancleRequests.length - 1].ShowDetails= true;
                    myAutoSize();
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





    //============= Saves =================



    //Accept Transfare
    s.acceptTransfare = form => {
        BlockingService.block();
        productsServ.acceptTransfare(s.payment).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.order.Payments[s.payment.TargetIndex] = d.data.Result;

                        s.order.TotalPaymentsAccepted += d.data.Result.Amount;
                        bootstrapModelHide("acceptTransfare");
                        myAutoSize();
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - acceptTransfare", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - acceptTransfare", err);
        })

    }

    s.cancleRequestPaymentImageSave = form => {
        if (form.$invalid) {
            s.cancleRequestDecisionFrmSubmitErro = true;
            return;
        }

        //التحقق من رفع الصورة
        if (!s.cancleRequestPaymentImage.TransfaerAmpuntImageFile) {

            SMSSweet.alert(
                LangIsEn ? "Please transfer and upload the bank transfer photo" : "الرجاء التحويل ورفع صورة الحوالة البنكية"
                , RequestTypeEnum.error);
            return;
        }

        BlockingService.block();
        productsServ.cancleRequestPaymentImage(s.cancleRequestPaymentImage).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        d.data.Result.ShowDetails = true;
                        s.order.CancleRequests[s.order.CancleRequests.findIndex(c => c.Id == s.cancleRequestPaymentImage.Id)] = d.data.Result;
                        bootstrapModelHide("cancleRequestPaymentImage");
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - cancleRequestPaymentImageSave", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - cancleRequestPaymentImageSave", err);
        })

    };


    //+-+-+-+-+-+-+-+- Other -+-+-+-+-+-+-+-+-
  

    //Show Model For Accept Payment
    s.showAcceptTransfare = (payment,index) => {

        s.payment = angular.copy(payment);
        s.payment.TargetIndex = index;
        s.payment.IsAcceptFromManger = true;
        bootstrapModelShow("acceptTransfare");
    };

    //Show Payment Cancle Request Remaining Amounts
    s.showCancleRequestPaymentImage = cancleRequest => {
        s.cancleRequestPaymentImage= { ...cancleRequest };
        s.cancleRequestPaymentImageFrmSubmitErro = false;
        bootstrapModelShow("cancleRequestPaymentImage");
    };

    //Uplaod For Accept Cancle Request
    s.cancleRequestPaymentUploadImage = files => {
        var fileReaer = new FileReader();
        let file = files[0];
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.cancleRequestPaymentImage.TransfaerAmpuntImage = d.target.result;
            s.cancleRequestPaymentImage.TransfaerAmpuntImageFile = file;
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