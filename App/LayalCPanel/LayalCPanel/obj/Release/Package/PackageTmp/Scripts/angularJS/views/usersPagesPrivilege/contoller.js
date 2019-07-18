
ngApp.controller('usersPagesPrivilegesCtrl', ['$scope', '$http', 'usersPagesPrivilegesServ', function (s, h, usersPagesPrivilegesServ) {
    s.state = StateEnum;
    s.usersPagesPrivileges = [];
    s.usersPagesPrivilegeFOP = {};
    s.usersPagesFilter = {
        userId: null,
        menuId: null,
    };
    s.menus = [{
        Id: null,
        MenuName: Token.select
    }];
    s.employees = [{
        Id: null,
        UserName: Token.select
    }];

    //============= G E T =================
    s.getUsersPagesPrivileges = reset => {

        if (reset) {
            s.usersPagesPrivilegeFOP = new FOP(lengthWithOutDeleted(s.usersPagesPrivileges));
        }

        let loading = BlockingService.generateLoding();
        loading.show();
        usersPagesPrivilegesServ.getUsersPagesPrivileges(s.usersPagesFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.skip += s.take;
                    if (reset) 
                        s.usersPagesPrivileges = [];

                    s.usersPagesPrivileges = s.usersPagesPrivileges.concat(d.data.Result);

                    if (s.usersPagesPrivilegeFOP && s.usersPagesPrivilegeFOP.paging)
                        s.usersPagesPrivilegeFOP = new FOP(lengthWithOutDeleted(s.usersPagesPrivileges), s.usersPagesPrivilegeFOP.paging.currentPage,
                            s.usersPagesPrivilegeFOP.paging.limitPagesTake,
                            s.usersPagesPrivilegeFOP.paging.limitPagesSkip);
                    else
                        s.usersPagesPrivilegeFOP = new FOP(lengthWithOutDeleted(s.usersPagesPrivileges));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getUsersPagesPrivileges", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getUsersPagesPrivileges", err);
        })
    };

    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        usersPagesPrivilegesServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.menus = s.menus.concat(d.data.Result.Menus);
                    s.employees = s.employees.concat(d.data.Result.Employees);

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


    //============= Saves =================

    s.saveChange = () => {
        if (s.usersPagesPrivileges.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }
        BlockingService.block();
        usersPagesPrivilegesServ.saveChange(s.usersPagesPrivileges).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };


    //============= Other =================
    s.reFop = length => {
        s.usersPagesPrivilegeFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;


    };


    //Call Functions
    s.getItems();
}]);