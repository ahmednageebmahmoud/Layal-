ngApp.service('productTypesServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/ProductTypes/' };



        //Methods
        getProductType(id) {
            return h({
                url: `${this.basePath}getProductTypeById?id=${id}`,
                method: 'get',
            });
        };




        //save productType  
        saveChange(productType) {
            let data = new FormData();

            data.append("productType.Id", productType.Id);
            data.append("productType.NameAr", productType.NameAr);
            data.append("productType.NameEn", productType.NameEn);
            data.append("productType.DescriptionAr", productType.DescriptionAr);
            data.append("productType.DescriptionEn", productType.DescriptionEn);
            data.append("productType.State", productType.State);

            data.append(`productType.Image`, productType.Image);
            data.append(`productType.ImageUrl`, productType.ImageUrl);
            data.append(`productType.StateImage`, productType.StateImage);
            



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