ngApp.controller('enquiresCtrl', ['$scope', '$http', 'enquiresServ', function (s, h, enquiresServ) {
    s.state = StateEnum;
    s.enquires = [];
    s.enquiyFOP = {};
    s.enquiryFilter = {
        skip: 0,
        take: Defaults.takeFromServer,
        EnquiryTypeId: null,
        CountryId: null,
        CityId: null,
        BranchId: null,
        FirstName: '',
        LastName: '',
        PhoneNo: '',
        IsLinkedClinet: null,
        CreateDateFrom: null,
        CreateDateTo: null
    };

    s.enquiryStatusTypesEnum = {
        notAnswer: 1,
        customerContacted: 2,
        rejectService: 3,
        fullApproval: 4,
        scheduleVisit: 5,
        needsToThink: 6,
        bookByCash: 7,
        bookBybankTransfer: 8

    };

    s.enquiryStatusTypes = [
    { Id: s.enquiryStatusTypesEnum.notAnswer, Name: Token.notAnswer },
    { Id: s.enquiryStatusTypesEnum.customerContacted, Name: Token.customerContacted },
    { Id: s.enquiryStatusTypesEnum.rejectService, Name: Token.rejectService },
    { Id: s.enquiryStatusTypesEnum.fullApproval, Name: Token.fullApproval },
    { Id: s.enquiryStatusTypesEnum.scheduleVisit, Name: Token.scheduleVisit },
    { Id: s.enquiryStatusTypesEnum.needsToThink, Name: Token.needsToThink },
    { Id: s.enquiryStatusTypesEnum.bookByCash, Name: Token.bookByCash },
    { Id: s.enquiryStatusTypesEnum.bookBybankTransfer, Name: Token.bookBybankTransfer },
    
    
    ];

    s.countries = [{ Id: null, CountryName: Token.select }];

    s.cities = [{ Id: null, CityName: Token.select, CountryId: null }];

    s.enquiryTypes = [{ Id: null, EnquiryTypeName: Token.select }];
    s.branches = [{Id: null, BranchName: Token.select, CityId: null}];

    s.publisheStatus = [
        { Id: null, Name: Token.select },
        { Id: false, Name: Token.publishByCLinet },
        { Id: true, Name: Token.publishByManger }];

    //============= G E T =================
    s.getEnquires = reset => {

        if (reset) {
            s.enquiryFilter.skip = 0;
            s.enquiyFOP = new FOP(lengthWithOutDeleted(s.enquires));
        }

        s.enquiryFilter.CreateDateFrom = $("#createDateFrom").val();
        s.enquiryFilter.CreateDateTo = $("#createDateTo").val();

        let loading = BlockingService.generateLoding();
        loading.show();

        enquiresServ.getEnquires(s.enquiryFilter).then(d => {
            loading.hide();
            if (reset)
                s.enquires = [];

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.enquires = s.enquires.concat(d.data.Result);
                    s.enquiryFilter.skip += s.enquiryFilter.take;

                    if (s.enquiyFOP && s.enquiyFOP.paging)
                        s.enquiyFOP = new FOP(lengthWithOutDeleted(s.enquires), s.enquiyFOP.paging.currentPage,
                            s.enquiyFOP.paging.limitPagesTake,
                            s.enquiyFOP.paging.limitPagesSkip);
                    else
                        s.enquiyFOP = new FOP(lengthWithOutDeleted(s.enquires));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEnquires", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEnquires", err);
        })
    };

    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        enquiresServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = s.countries.concat(d.data.Result.Countries);
                    s.cities = s.cities.concat(d.data.Result.Cities);
                    s.enquiryTypes = s.enquiryTypes.concat(d.data.Result.EnquiryTypes);;
                    s.branches = s.branches.concat(d.data.Result.Branches);;

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
        if (s.getEnquires.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }
        BlockingService.block();
        enquiresServ.saveChange(s.enquires).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //add New Status
    s.addNewStatus = form=> {
        if (form.$invalid) {
            s.enquiytStusSubmitErro = true;
            return;
        }
        s.enquiytStusSubmitErro = false;

        //نتحقق من صورة الحوالة
        if (s.enquiryStatusTypesEnum.bookBybankTransfer == s.enquiryNewStatus.StatusId && !s.enquiryNewStatus.BankTransferImage)
           
        {
            SMSSweet.alert(LangIsEn ? "Payment image not found" : "صورة الحوالة ليست موجودة", RequestTypeEnum.error);
            return;
        }


         
        BlockingService.block();
        enquiresServ.addNewStatus(s.enquiryNewStatus).then(d => {

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                             bootstrapModelHide("addStatus");

                } break;
            }
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
            BlockingService.unBlock();
            co("P O S T - addNewStatus", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - addNewStatus", err);
        })
    };
    //============= Delete ================
    s.delete = enquiry => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            enquiry.State = StateEnum.delete;
            BlockingService.block();
            enquiresServ.saveChange(enquiry).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.enquires.splice(s.enquires.findIndex(c => c.Id == enquiry.Id), 1)
                            s.reFop(s.enquires.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= Other =================
    s.reFop = length => {
        s.enquiyFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;


    };
    s.fillDayMax = month=> {
        switch (month) {
            case 2:
                return 29;
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
        }
    };

    //================= Other ======================
    s.showAddStatus = enquiry => {
        s.enquiryNewStatus = {
            EnquiryId: enquiry.Id,
            BranchId: enquiry.BranchId,
            EnquiryBranchId: enquiry.BranchId,
            StatusId: null,
            IsBookByBankTransfer: true,
            ClinetName:enquiry.FirstName+' '+enquiry.LastName,
        };
        $('[type="file"]').val(null);
        bootstrapModelShow("addStatus");
    };

    //رفع صورة الحوالة البنكية 
    s.uplaodBantTrnasferPhoto = file=> {
        s.enquiryNewStatus.BankTransferImageName = file.name;
        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(file);
        fileReaer.onload = (d) => {
            s.enquiryNewStatus.BankTransferImage = d.target.result;
            s.$apply();
        }
    };


    //Call Functions
    s.getItems();
    s.getEnquires();
}]);