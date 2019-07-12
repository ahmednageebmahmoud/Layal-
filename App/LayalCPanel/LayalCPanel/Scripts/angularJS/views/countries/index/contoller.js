ngApp.controller('countriesCtrl', ['$scope', '$http', 'countriesServ', function (s, h, countriesServ) {
    s.state = StateEnum;
    s.countries = [];
    s.countryFOP = {};
    s.countryFilter = {
        skip:0,
        take:30
    };


   


    //============= G E T =================
    s.getCountries = reset => {

        if (reset) {
            s.countryFilter.skip = 0;
            s.countryFOP = new FOP(lengthWithOutDeleted(s.countries));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        countriesServ.getCountries(s.countryFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset)
            s.countries = [];

                    s.countries = s.countries.concat(d.data.Result);
                    s.countryFilter.skip += s.countryFilter.take;


                    if (s.countryFOP && s.countryFOP.paging)
                        s.countryFOP = new FOP(lengthWithOutDeleted(s.countries), s.countryFOP.paging.currentPage,
                            s.countryFOP.paging.limitPagesTake,
                            s.countryFOP.paging.limitPagesSkip);
                    else
                        s.countryFOP = new FOP(lengthWithOutDeleted(s.countries));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getCountries", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getCountries", err);
        })
    };

     
    //============= Saves =================

    s.saveChange = () => {
        if (s.getCountries.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }

        BlockingService.block();
        countriesServ.saveChange(s.countries).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //============= Delete ================
    s.delete = country => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            country.State = StateEnum.delete;
            BlockingService.block();
            countriesServ.saveChange(country).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.countries.splice(s.countries.findIndex(c => c.Id == country.Id), 1)
                            s.reFop(s.countries.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };


    //============= Other =================
    s.reFop = length => {
        s.countryFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {
        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };


    //Call Functions
    s.getCountries();
}]);