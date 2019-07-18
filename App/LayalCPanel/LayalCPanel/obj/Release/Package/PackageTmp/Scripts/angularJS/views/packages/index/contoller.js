ngApp.controller('packagesCtrl', ['$scope', '$http', 'packagesServ', function (s, h, packagesServ) {
    s.state = StateEnum;
    s.packages = [];
    s.packageFOP = {};
    s.packageFilter = {
        skip:0,
        take:30
    };


   


    //============= G E T =================
    s.getPackages = reset => {

        if (reset) {
            s.packageFilter.skip = 0;
            s.packageFOP = new FOP(lengthWithOutDeleted(s.packages));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        packagesServ.getPackages(s.packageFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset)
            s.packages = [];

                    s.packages = s.packages.concat(d.data.Result);
                    s.packageFilter.skip += s.packageFilter.take;


                    if (s.packageFOP && s.packageFOP.paging)
                        s.packageFOP = new FOP(lengthWithOutDeleted(s.packages), s.packageFOP.paging.currentPage,
                            s.packageFOP.paging.limitPagesTake,
                            s.packageFOP.paging.limitPagesSkip);
                    else
                        s.packageFOP = new FOP(lengthWithOutDeleted(s.packages));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getPackages", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getPackages", err);
        })
    };

     
    //============= Saves =================

    s.saveChange = () => {
        if (s.getPackages.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }

        BlockingService.block();
        packagesServ.saveChange(s.packages).then(d => {
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
    s.delete = packag => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            packag.State = StateEnum.delete;
            BlockingService.block();
            packagesServ.saveChange(packag).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.packages.splice(s.packages.findIndex(c => c.Id == packag.Id), 1)
                            s.reFop(s.packages.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };


    //============= Other =================
    s.reFop = length => {
        s.packageFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {
        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };


    //Call Functions
    s.getPackages();
}]);