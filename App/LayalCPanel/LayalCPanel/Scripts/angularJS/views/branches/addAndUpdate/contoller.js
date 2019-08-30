ngApp.controller('branchesCtrl', ['$scope', '$http', 'branchesServ', function (s, h, branchesServ) {
    s.state = StateEnum;
    s.branches = [];
    s.branchFOP = {};
    var branchId = getQueryStringValue("id");
    s.branch = {
        Id: branchId,
        State: branchId ? StateEnum.update : StateEnum.create,
        CountryId: null,
        CityId: null,


        ArchivingAndSaveingEmployeeId:null,
        ImplementationEmployeeId: null,
        CoordinationEmployeeId: null,
        ArchivingAndSaveingAnotherBranchId:null
    };


    s.countries = [{
        Id: null,
        CountryName: Token.select
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId:null
    }];

    s.branches = [{
        Id: null,
        BranchName: Token.select,
    }];
    
    s.worksTypesEnnum = worksTypesEnnum;
    s.employees = [{
        Id: null,
        UserName: Token.select,
        
    }];


    //============= G E T =================
    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getItems(branchId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = s.countries.concat(d.data.Result.Countries);
                    s.cities = s.cities.concat(d.data.Result.Cities);
                    s.branches = s.branches.concat(d.data.Result.Branches);

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

    s.getItemsByBranchId = (branchId) => {

        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getItemsByBranchId(branchId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                   
                    s.employees = s.employees.concat(d.data.Result.Employees);
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getItemsByBranchId", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getItemsByBranchId", err);
        })
    };
    
    //Get Branches
    s.getBranch = () => {
        if (!branchId)
            return;
        s.getItemsByBranchId(branchId);
        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getBranch(branchId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.branch = d.data.Result;
                    s.branch.Password = null;
                    s.branch.State = StateEnum.update;
                    s.isBasicDisabled = s.branch.IsBasic;
                    
                    setTimeout(() => {
                        $("select[serchbale]").select2();
                    }, 500)
                    
    
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getBranch", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getBranch", err);
        })
    }

    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.branchFormSubmitErro = true;
            return;
        }

        s.branchFormSubmitErro = false;
        BlockingService.block();
        branchesServ.saveChange(s.branch).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.branch = d.data.Result;
                    
                    //Get Employees
                    if (s.branch.State == StateEnum.create)
                    s.getItemsByBranchId(s.branch.Id);


                    s.branch.State = StateEnum.update;
                    s.isBasicDisabled = s.branch.IsBasic;

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
        s.branchFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;


    };


    //Call Functions
    s.getItems();
    s.getBranch();
}]);