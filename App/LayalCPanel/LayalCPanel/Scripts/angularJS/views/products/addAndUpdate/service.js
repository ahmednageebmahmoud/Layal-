ngApp.service('productsServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/Products/' };



        //Methods
        getProduct(id) {
            return h({
                url: `${this.basePath}getProductById?id=${id}`,
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

            data.append("product.Id", product.Id);
            data.append("product.WordId", product.WordId);
            data.append("product.WordDescriptionId", product.WordDescriptionId);
            data.append("product.WordUploadFileNotesId", product.WordUploadFileNotesId);

            data.append("product.NameAr", product.NameAr);
            data.append("product.NameEn", product.NameEn);
            data.append("product.DescriptionAr", product.DescriptionAr);
            data.append("product.DescriptionEn", product.DescriptionEn);
            data.append("product.UplaodFileNotesAr", product.UplaodFileNotesAr);
            data.append("product.UplaodFileNotesEn", product.UplaodFileNotesEn);
            data.append("product.ProductTypeId", product.ProductTypeId);
            data.append("product.IsActive", product.IsActive);
            data.append("product.State", product.State);

            //Options 
            if (product.Options)
                product.Options.forEach((option, optionIndex) => {
                    data.append(`product.Options[${optionIndex}].Id`, option.Id);
                    data.append(`product.Options[${optionIndex}].StaticFieldId`, option.StaticField.Id);
                    data.append(`product.Options[${optionIndex}].State`, option.State);

                    //Options Items
                    if (option.Items)
                        option.Items.forEach((item, itrmIndex) => {
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].Id`, item.Id);
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].ValueAr`, item.ValueAr);
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].ValueEn`, item.ValueEn);
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].Price`, item.Price);
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].State`, item.State);
                            data.append(`product.Options[${optionIndex}].Items[${itrmIndex}].WordValueId`, item.WordValueId);
                            
                        });
                });

            //Images
            if (product.Images)
                product.Images.forEach((f, index) => {
                    data.append(`product.Images[${index}].Id`, f.Id);
                    data.append(`product.Images[${index}].File`, f.File);
                    data.append(`product.Images[${index}].State`, f.State);
                    data.append(`product.Images[${index}].ImageUrl`, f.ImageUrl);
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