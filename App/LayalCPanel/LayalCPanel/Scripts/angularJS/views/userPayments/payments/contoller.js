
ngApp.controller('paymentsInformationsCtrl', ['$scope', '$http', 'paymentsInformationsServ', function (s, h, paymentsInformationsServ) {
    s.state = StateEnum;
    s.paymentsInformations = [];
    s.paymentsInformationFOP = {};
    s.skip = 0;
    s.take = Defaults.takeFromServer;
    s.payment = {
        State: StateEnum.create
    }
    s.paymentStatus = [{ Id: true, Name: LangIsEn ?'Accept':'معتمدة'},{ Id: false, Name: LangIsEn ?'Reject':'مرفوضة'}]
    s.userToId = getQueryStringValue("id");
   

    //============= G E T =================
    s.getUserPayments = () => {
        if (!s.userToId) {
            SMSSweet.alert(LangIsEn ? 'User Id Not Found' : 'معرف المستخدم غير موجود', RequestTypeEnum.error);
            return;
        }

        let loading = BlockingService.generateLoding();
        loading.show();

        paymentsInformationsServ.getUserPayments(s.userToId,s.skip,s.take).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.skip += s.take;
                    s.userToName = d.data.Result.UserName;

                    s.paymentsInformations = s.paymentsInformations.concat(d.data.Result.PaymentsInformations);

                    if (s.paymentsInformationFOP && s.paymentsInformationFOP.paging)
                        s.paymentsInformationFOP = new FOP(lengthWithOutDeleted(s.paymentsInformations), s.paymentsInformationFOP.paging.currentPage,
                            s.paymentsInformationFOP.paging.limitPagesTake,
                            s.paymentsInformationFOP.paging.limitPagesSkip);
                    else
                        s.paymentsInformationFOP = new FOP(lengthWithOutDeleted(s.paymentsInformations));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
               case RequestTypeEnum.info:
                    {
                        s.userToName = d.data.Result.UserName;
                        SMSSweet.alert(d.data.Message, d.data.RequestType);

                    }
                    break;
            }
            co("G E T - getPaymentsInformations", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getPaymentsInformations", err);
        })
    };



    //============= Saves =================
   
    s.saveChange = (form) => {

        if (form.$invalid) {
            s.paymentFormErrorSubmit = true;
            return;
        }
        s.paymentFormErrorSubmit = false;
        if(! s.payment.State)
        s.payment.State = StateEnum.create;
        s.payment.UserToId = s.userToId;
        
        //نتحقق من وجود صورة الدفع 
        if (!s.payment.PaymentImage&&s.payment.IsAcceptFromManger && (s.payment.IsBankTransfer || !s.currentAdmin))
        {
            SMSSweet.alert(LangIsEn ? "Payment image not found" : "صورة الحوالة ليست موجودة", RequestTypeEnum.error);
            return;
        }


        
        BlockingService.block();
        paymentsInformationsServ.saveChange(s.payment).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    //Add To List Or Update List
                    if (s.payment.State == StateEnum.create)
                        s.paymentsInformations.unshift(d.data.Result);
                    else
                        s.paymentsInformations[s.paymentsInformations.findIndex(c=> c.Id = d.data.Result.Id)] = d.data.Result;

                    s.payment = {
                        State: StateEnum.create
                    }

                    $('[type="file"').val(null)

                   
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - saveChange", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        });
    };


    //payment Update
    s.paymentUpdate = paymentUpd=> {
        s.payment = angular.copy(paymentUpd);
        s.payment.State=StateEnum.update;
    };

    //============= Other =================
    s.reFop = length => {
        s.paymentsInformationFOP.reFop(length);
    };


    //================= Other ======================
        //رفع صورة الحوالة البنكية 
    s.uplaodBantTrnasferPhoto = file=> {
        s.payment.PaymentImageName = file.name;
        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.payment.PaymentImage = d.target.result;
            s.$apply();
        }
    };
    //Call Functions
    s.getUserPayments();
}]);