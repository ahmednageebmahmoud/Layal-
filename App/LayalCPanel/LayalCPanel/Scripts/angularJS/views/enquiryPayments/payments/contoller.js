ngApp.controller('paymentsInformationsCtrl', ['$scope', '$http', 'paymentsInformationsServ', function (s, h, paymentsInformationsServ) {
    s.state = StateEnum;
    s.paymentsInformations = [];
    s.paymentsInformationFOP = {};

    var enquiryId = getQueryStringValue("id");

    //============= G E T =================
    s.getPaymentsInformations = () => {

        if (!enquiryId) {
            SMSSweet.alert(LangIsEn ? 'Enquiry Id Not Found' : 'معرف الاستفسار غير موجود', RequestTypeEnum.error);
            return;
        }

        let loading = BlockingService.generateLoding();
        loading.show();

        paymentsInformationsServ.getPaymentsInformations(enquiryId).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.paymentsInformations = s.paymentsInformations.concat(d.data.Result.PaymentsInformations);
                    s.enquiry = d.data.Result.Enquiry;
                    s.event = d.data.Result.Event;
                    if (s.event && s.event.EventDateTimeDisplay)
                    s.event.EventDateTime = new Date(Date.parse(s.event.EventDateTimeDisplay))

                    s.paymentsInformationFOP = new FOP(lengthWithOutDeleted(s.paymentsInformations));
                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
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
    s.acceptFromManger = (paymetn) => {
        BlockingService.block();
        paymentsInformationsServ.acceptFromManger(paymetn).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    {
                        paymetn.IsAcceptFromManger = false;
                        SMSSweet.alert(d.data.Message, d.data.RequestType);
                    }
                    break;
            }
            co("G E T - acceptFromManger", d);
        }).catch(err => {
            paymetn.IsAcceptFromManger = false;

            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - acceptFromManger", err);
        })
    };

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.paymentFormErrorSubmit = true;
            return;
        }
        s.paymentFormErrorSubmit = false;
        s.newPayment.State = StateEnum.create;
        s.newPayment.EnquiryId = enquiryId;
        s.newPayment.BranchId = s.enquiry.BranchId;
        
        
        BlockingService.block();
        paymentsInformationsServ.saveChange(s.newPayment).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newPayment = {};
                    $('[type="file"').val(null)
                    s.paymentsInformations.push(d.data.Result);
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


    //============= Other =================
    s.reFop = length => {
        s.paymentsInformationFOP.reFop(length);
    };


    //================= Other ======================
        //رفع صورة الحوالة البنكية 
    s.uplaodBantTrnasferPhoto = file=> {
        s.newPayment.BankTransferImageName = file.name;
        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.newPayment.BankTransferImage = d.target.result;
            s.$apply();
        }
    };
    //Call Functions
    s.getPaymentsInformations();
}]);