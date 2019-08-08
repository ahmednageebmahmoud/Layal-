ngApp.controller('paymentsInformationsCtrl', ['$scope', '$http', 'paymentsInformationsServ', function (s, h, paymentsInformationsServ) {
    s.state = StateEnum;
    s.paymentsInformations = [];
    s.paymentsInformationFOP = {};
    s.skip = 0;
    s.take = Defaults.takeFromServer;


    //============= G E T =================
    s.getUserPayments = () => {

        let loading = BlockingService.generateLoding();
        loading.show();

        paymentsInformationsServ.getUserPayments(s.skip,s.take).then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.skip += s.take;
                    s.paymentsInformations = s.paymentsInformations.concat(d.data.Result);

                    if (s.paymentsInformationFOP && s.paymentsInformationFOP.paging)
                        s.paymentsInformationFOP = new FOP(s.paymentsInformations.length, s.paymentsInformationFOP.paging.currentPage,
                            s.paymentsInformationFOP.paging.limitPagesTake,
                            s.paymentsInformationFOP.paging.limitPagesSkip);
                    else
                        s.paymentsInformationFOP = new FOP(s.paymentsInformations.length);

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


    //============= Other =================
    s.reFop = length => {
        s.paymentsInformationFOP.reFop(length);
    };


    //Call Functions
    s.getUserPayments();
}]);