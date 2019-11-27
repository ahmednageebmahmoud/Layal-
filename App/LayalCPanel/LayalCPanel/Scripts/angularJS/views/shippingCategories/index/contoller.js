ngApp.controller('shippingCategoriesCtrl', ['$scope', '$http', 'shippingCategoriesServ', function (s, h, shippingCategoriesServ) {
    s.state = StateEnum;
    s.shippingCategories = [];
    s.shippingCategoryFOP = {};
    s.shippingCategoryFilter = {
        skip:0,
        take:30
    };


   


    //============= G E T =================
    s.getItems = () => {
        let loading = BlockingService.generateLoding();
        loading.show();
        shippingCategoriesServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = d.data.Result.Countires;
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

    s.getCities = () => {
        BlockingService.block();
        shippingCategoriesServ.getCities(s.countryId).then(d => {
            BlockingService.unBlock();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.cities = d.data.Result;
                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getCities", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getCities", err);
        })
    };
    
     
    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.countryFrmErrorSubmit = true;
            return  ;
        }
        s.countryFrmErrorSubmit = false;

        BlockingService.block();
        shippingCategoriesServ.saveChange(s.cities).then(d => {
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
 

   


    //============= Other =================
    s.reFop = length => {
        s.shippingCategoryFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {
        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };
    s.selectAllCities = () => {
        if(s.selectAll)
        {
            //Un Select ALL
            s.cities.forEach(c=> c.Selected=true);
        } else {
            //Select All
            s.cities.forEach(c=> c.Selected=false);
        }
    };

    s.changePrice = (isCitySelected,price) => {
        if (!isCitySelected) return;
        s.cities.filter(c=> c.Selected).forEach(c=> c.ShippingPrice = price);
    };


    //Selctable
    //$(".item").selectable({
    //    filter: '.iem',
    //    selected: function (d) {
            

    //        $('.iem').each(function (i, file) {
    //            if ($(file).hasClass("ui-selected"))
    //            {
    //                    s.cities.find(c=> c.Id == file.dataset.id).Selected = true;
    //            }
    //        });
    //        s.$apply();
    //    }
    //});

    //Call Functions
    s.getItems();
}]);