ngApp.controller('sharedCtrl', ['$scope', '$http', 'sharedServ', '$rootScope',
                                 'DTOptionsBuilder', 'DTColumnBuilder', 'DTColumnDefBuilder',
                                 function (s, h, sharedServ, rs, DTOptionsBuilder, DTColumnBuilder, DTColumnDefBuilder) {

                                     //Data Table Seting
                                     rs.initDataTables = () => {
                                         s.vm = {};
                                         s.vm.dtInstance = {};
                                         s.vm.dtColumnDefs = [DTColumnDefBuilder.newColumnDef(2).notSortable()];
                                         s.vm.dtOptions = DTOptionsBuilder.newOptions()
                                                           .withOption('paging', false)
                                                           .withOption('searching', false)
                                                           .withOption('info', false)
                                                           .withOption('sort', false)
                                                           .withButtons([
                                                                               {
                                                                                   extend: 'copy',
                                                                                   text: 'Copy',
                                                                                   titleAttr: 'Copy'
                                                                               },
                                                                               {
                                                                                   extend: 'print',
                                                                                   text: 'Print',
                                                                                   titleAttr: 'Print'
                                                                               },
                                                                               {
                                                                                   extend: 'excel',
                                                                                   text: 'Excel',
                                                                                   titleAttr: 'Excel'
                                                                               },
                                                                               {
                                                                                   extend: 'pdf',
                                                                                   text: 'Pdf',
                                                                                   titleAttr: 'Pdf'
                                                                               }
                                                           ]);

                                     };
                                     rs.initDataTables();

                                     s.state = StateEnum;
                                     s.langIsEn = LangIsEn;
                                     s.notifyId = getQueryStringValue("notifyId");

                                     s.notifyIsRead = Boolean(getQueryStringValue("isRead"));

                                     s.currentControler = getcurrentController()
                                     s.currentUserInfromation = Auth.userInfromation;

                                     if (s.currentUserInfromation.ReturnUrl) {
                                         if (!window.location.href.includes('/Users/ActiveEmail'))
                                             window.location.href = s.currentUserInfromation.ReturnUrl;
                                         return;
                                     }

                                  
        //============= G E T =================

        //get Notifications
        rs.getNotifications = () => {
            sharedServ.getNotifications().then(d => {
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess: {
                        rs.notifications = d.data.Result;
                    } break;
                }
                co("G E T - Notifications", d);
            }).catch(err => {
                SMSSweet.alert(err.statusText, RequestTypeEnum.error);
                co("E R R O R - Notifications", err);
            })
        };

        //read Notification
        rs.readNotification = notifyId => {
            if (!s.notifyIsRead) {

                console.log("I Read Notification");
                sharedServ.readNotification(notifyId).then(d => {
                    switch (d.data.RequestType) {
                        case RequestTypeEnum.sucess: {

                        } break;
                    }
                    co("G E T - Notifications", d);
                });
            }
        };

        s.getMenus = () => {
            //Get Meun From Local Stoarge
            s.menus = LocalStorageService.menus;

            if (!s.menus)
                sharedServ.getMenus().then(d => {
                    switch (d.data.RequestType) {
                        case RequestTypeEnum.sucess: {
                            s.menus = d.data.Result;
                            //Save Menus In Local Storage
                            LocalStorageService.menus = s.menus;

                        } break;
                    }
                    co("G E T - getMenus", d);
                }).catch(err => {
                    SMSSweet.alert(err.statusText, RequestTypeEnum.error);
                    co("E R R O R - getMenus", err);
                });
        };


        //التحقق من ان الكونترولر الحالى هوا موجود فى القائمة الحالية 
        s.menuOpen = (menu) => {
            var isOpen = menu.Pages.filter(b => ('/' + s.currentControler).includes(b.Url) || window.location.pathname == b.Url).length > 0;
            return isOpen;
        };


        s.checkIsCrrentPageEquals = (chaekForHomePage, url) => {
            if (chaekForHomePage)
                return s.currentControler == "";

            return window.location.pathname == url; //|| ('/' + s.currentControler).includes(url);
        };

        //call read notification
        if (s.notifyId)
            rs.readNotification(s.notifyId);


        //Re-Select 
        s.reSelect = () => {
            setTimeout(() => {
                $("select[serchbale]").select2();
            }, 1000)
        };

        //Log Out
        s.logOut = () => {
            localStorage.clear();
        }

        //changeLanguage
        s.changeLanguage = langId => {
            BlockingService.block()
            sharedServ.changeLanguage(langId).then(d => {
                BlockingService.unBlock()
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess: {
                        Auth.addUserInformation(d.data.Result);
                        LocalStorageService.menus = null;
                        window.location.reload()
                    } break;
                }
                co("G E T - changeLanguage", d);
            }).catch(err => {
                BlockingService.unBlock()
                SMSSweet.alert(err.statusText, RequestTypeEnum.error);
                co("E R R O R - changeLanguage", err);
            });
        };


        s.getNotifications();
        s.getMenus();
    }]);