 
class SMSToastr {

    constructor() {
        // init bootstrap switch
        $('[data-switch=true]').bootstrapSwitch();
    }

    /**
     *  show new notification 
     * @param {Notification} notify
     */
    static notification(notify) {
        new Audio('/assets/sound/Notification.mp3').play();
        let content = {
            message: LangIsEn ? notify.DescriptionEn : notify.DescriptionAr,
            title: LangIsEn ? notify.TitleEn : notify.TitleAr,
            url: `${notify.FullRedirectUrl}`,
            target: '_blank',
        };

        let options = {
            allow_dismiss: true,
            newest_on_top: true,
            mouse_over: false,
            showProgressbar: false,
            spacing: 10,
            timer: 4000,
            type: "success",
         //   icon: "fa fa-check-double",
            placement: {
                from: "bottom",
                align: LangIsEn?"right": "left"
            },
            offset: {
                x: 30,
                y: 30,
            },
            delay: 1000,
            z_index: 10000,
            animate: {
                enter: 'animated bounce',
                exit: 'animated rubberBand'
            }
        };


        $.notify(content, options);
    }

    static alert(message, requestType, url, title) {

        let content = { message, title, url, target: '_blank', };

        let options = {
            allow_dismiss: true, // اضافة زر للاغلاق
            newest_on_top: false,
            mouse_over: false, //الاغلاق عند وضع الموس
            showProgressbar: false,//البروجرس واذا نريد ان نضيفها فـ يوجد لها اعدادات آخرى
            spacing: 10,
            timer: 5000,
            placement: {
                from: "top",
                align: "right"
            },
            offset: {
                x: 30,
                y: 30,
            },
            delay: 1000,
            z_index: 10000,
            animate: {
                enter: 'animated bounce',
                exit: 'animated rubberBand'
            }
        };

        switch (requestType) {
            case RequestTypeEnum.sucess: {
                options.type = "success";
                content.icon = "fa fa-check-double";
            } break;
            case RequestTypeEnum.error: {
                options.type = "danger";
                content.icon = "fa fa-exclamation-triangle";
            } break;
            case RequestTypeEnum.warning: {
                options.type = "warning";
                content.icon = "la la-warning";
            } break;
            case RequestTypeEnum.info: {
                options.type = "info";
                content.icon = "flaticon-exclamation-2";
            } break;
        }

        $.notify(content, options);
    }

}


