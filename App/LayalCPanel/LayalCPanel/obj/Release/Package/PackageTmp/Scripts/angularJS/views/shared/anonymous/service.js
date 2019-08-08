ngApp.service('sharedServ', ['$http', function (h) {

    class funcs {

        //Getter
        get hmoePath() { return '/Home/' };


    };
    return new funcs();
}]);