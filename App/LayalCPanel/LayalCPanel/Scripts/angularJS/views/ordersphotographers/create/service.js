ngApp.service('productsServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/Ordersphotographers/' };



        //Methods
        getProductsByProductTypeId(id) {
            return h({
                url: `${this.basePath}getProductsByProductTypeId?productTypeId=${id}`,
                method: 'get',
            });
        };
        getCities(id) {
            return h({
                url: `${this.basePath}getCities?countryId=${id}`,
                method: 'get',
            });
        };
        

        getProductDetails(id) {
            return h({
                url: `${this.basePath}getProductDetails?productId=${id}`,
                method: 'get',
            });
        };


        
        //Get Items
        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

        //save product  
        saveChange(product) {
            let data = new FormData();

            data.append("order.ProductTypeId", product.ProductTypeId);
            data.append("order.ProductId", product.ProductId);
            data.append("order.Delivery_IsReceiptFromTheBranch", product.Delivery_IsReceiptFromTheBranch);
            data.append("order.Delivery_CountryId", product.Delivery_CountryId);
            data.append("order.Delivery_CityId", product.Delivery_CityId);
            data.append("order.Delivery_Address", product.Delivery_Address);

            //Options 
            if (product.Options)
                product.Options.forEach((option, optionIndex) => {
                    data.append(`order.Options[${optionIndex}].Id`, option.Id);
                    data.append(`order.Options[${optionIndex}].ProductOptionItemSelectedId`, option.ProductOptionItemSelectedId);
                });

            //Images
            if (product.Images)
                product.Images.forEach((f, index) => {
                    data.append(`order.Files[${index}].File`, f.File);
                });

            return h({
                url: `${this.basePath}saveChange`,
                method: 'post',
                data: data,
                headers: { 'Content-Type': angular.undefined }
            });
        };



    };
    return new funcs();
}]);