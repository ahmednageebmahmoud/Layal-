ngApp.controller('productsCtrl', ['$scope', '$http', 'productsServ', function (s, h, productsServ) {
    s.state = StateEnum;
    s.newOption = {
        Items: [],
        State: StateEnum.create
    };
    s.newOptionItem = {};



    s.newProduct = {
        Id: getQueryStringValue('id') || null,
        NameAr: null,
        NameEn: null,
        DescriptionAr: null,
        DescriptionEn: null,
        UplaodFileNotesAr:null,
        UplaodFileNotesEn: null,
        IsActive: true,
        ProductTypeId:null,
        Images: [],
        Options:[],
        State: StateEnum.create,
    }




    //============= G E T =================
    s.getProduct = reset => {
        if (!s.newProduct.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getProduct(s.newProduct.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newProduct = d.data.Result;
                    s.newProduct.State = StateEnum.update;
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProduct", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProduct", err);
        })
    };

    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();
        productsServ.getItems(s.newProduct.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.staticFields = d.data.Result.StaticFields;
                    s.productTypes = d.data.Result.ProductTypes;
                    selectTo();

                    
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

    s.saveChange = (form) => {
        if (form.$invalid || s.newProduct.Options.filter(c=> c.State != StateEnum.delete).length == 0 || s.newProduct.Images.filter(c=> c.State != StateEnum.delete).length == 0) {
            s.productFrmErrorSubmit = true;
            return;
        }
        s.productFrmErrorSubmit = false;
        BlockingService.block();
        productsServ.saveChange(s.newProduct).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.newProduct = d.data.Result;
                        s.newProduct.State = StateEnum.update;
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })
    };

    s.saveChangeOption=(form)=>{
        if (form.$invalid) {
            s.optionFrmSubmitError = true;
            return;
        }
        s.optionFrmSubmitError = false;

        s.newOption.StaticField = s.staticFields.find(c=> c.Id == s.newOption.StaticFieldId);

        //Check If Create
        if(s.newOption.State==StateEnum.create)
        {
            s.newProduct.Options.unshift(s.newOption);
        }else{
            s.newProduct.Options[s.newProduct.Options.findIndex(c=> c.Id==s.newOption.Id)]=angular.copy(s.newOption);
        }

        s.newOption = {};
        bootstrapModelHide('addNewOption');
    }

    //+-+-+-+-+-+- Add +-+-+-+-+-+-+-+-+-+-
    s.addNewOptionItem = () => {
        if (!s.newOptionItem.ValueAr || !s.newOptionItem.ValueEn || !s.newOptionItem.Price)
        {
            s.newOpetionItemErrorr=true;
            return;
        }
        s.newOpetionItemErrorr = false;
        if (s.newOption.State != StateEnum.update)
            s.newOption.State = StateEnum.create;
        s.newOptionItem.State = StateEnum.create;
        s.newOption.Items.unshift(angular.copy(s.newOptionItem));
        s.newOptionItem = {};
    };

    //-+-+-+-+-+-+ Delete -+-+-+-++-+++-+-+
    s.deleteOptionItem = (index) => {
        if (s.newOption.State == StateEnum.create) {
            s.newOption.Items.splice(index, 1);
        }else{
            s.newOption.Items[index].State = StateEnum.delete;
            s.newOption.State = StateEnum.update;
        }
    };

    s.deleteOption = (index) => {
        SMSSweet.delete(() => {
            s.newProduct.Options[index].State = StateEnum.delete;
            s.$apply();
        });
    };

    s.deleteImage = index => {
        if (s.newProduct.State == StateEnum.update) {
            //Set State Delete For Delete From Server
            s.newProduct.Images[index].State = StateEnum.delete;

        } else {
            //Delete By Splice
            s.newProduct.Images.splice(index, 1)
        }
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //Uplaod Images
    s.uplaodImages = files => {
        if (s.newProduct.Images.length >= 10) {
            SMSSweet.alert(LangIsEn ? "No more than 10 photos can be downloaded" : "لا يمكن تحميل اكثر من 10 صور", RequestTypeEnum.error);
            return;
        }

        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.newProduct.Images.length < 10) {
                    s.newProduct.Images.push({
                        State: StateEnum.create,
                        File: file,
                        ImageUrl: d.target.result
                    });
                    s.$apply();
                }
            }
        }

    }


    s.addOrUpdateOptionShowModel = option => {
        if (option)
        option.State = StateEnum.update;

        s.newOption =option || {
            Items: [],
            State: StateEnum.create
        };
        s.newOptionItem = {};
        bootstrapModelShow('addNewOption');
        selectTo();
    };


    //Call Functions
    s.getProduct();
    s.getItems();
}]);