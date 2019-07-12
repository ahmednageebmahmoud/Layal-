ngApp.service('sharedServ', ['$http', function (h) {

    class funcs {

        //Getter
        get hmoePath() { return '/Home/' };

        //Get Notifications
        getNotifications() {
            return h({
                url: `${this.hmoePath}getNotifications?take=10&isRead=false`,
                method: 'get',
            });
        };


        changeLanguage(langId) {
            return h({
                url: `${this.hmoePath}changeLanguage?langId=${langId}`,
                method: 'get',
            });
        };

        
        //Read Notification
       readNotification(notifyId) {
            return h({
                url: `${this.hmoePath}readNotification?notifyId=${notifyId}`,
                method: 'post',
            });
        };

        //Menus
        getMenus( ) {
            return h({
                url: `${this.hmoePath}getMenus`,
                method: 'get',
            });
        };


    };
    return new funcs();
}]);