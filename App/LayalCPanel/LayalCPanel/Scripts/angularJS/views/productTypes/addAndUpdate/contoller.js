ngApp.controller('productTypesCtrl', ['$scope', '$http', 'productTypesServ', function (s, h, productTypesServ) {
    s.state = StateEnum;
    s.productTypes = [];
    s.productTypeFOP = {};



    s.newProductType = {
        Id: getQueryStringValue('id') || null,
        NameAr: null,
        NameEn: null,
        DescriptionAr: null,
        DescriptionEn: null,
        ProductTypeFiles: [],
        State: StateEnum.create,
    }




    //============= G E T =================
    s.getProductType = reset => {
        if (!s.newProductType.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        productTypesServ.getProductType(s.newProductType.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newProductType = d.data.Result;
                    s.newProductType.State = StateEnum.update;
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getProductType", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getProductType", err);
        })
    };


    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid || !s.newProductType.ImageUrl) {
            s.productTypeFrmErrorSubmit = true;
            return;
        }
        s.productTypeFrmErrorSubmit = false;
        BlockingService.block();
        productTypesServ.saveChange(s.newProductType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.newProductType = d.data.Result;
                        s.newProductType.State = StateEnum.update;
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

    
    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //Uplaod Images
    s.uplaodImages = files => {

        var fileReaer = new FileReader();
        fileReaer.readAsDataURL(files[0]);
        let file = files[0];
        fileReaer.onload = (d) => {
                s.newProductType.ImageUrl = d.target.result;
                s.newProductType.Image = file;
                s.newProductType.StateImage = StateEnum.create;
            s.$apply();
        }

    }


    //Call Functions
    s.getProductType();
}]);