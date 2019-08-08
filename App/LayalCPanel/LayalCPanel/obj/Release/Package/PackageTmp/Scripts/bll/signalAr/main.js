
/**
 * For Dispaly User Notifications
 * @param {any} totalNotif
 * @param {any} message
 */
function showNotify( message) {
    if (message)
        angular.element($('body')).scope().$root.getNotifications();



    if (Array.isArray(message)) {
        message.forEach(c => {
            SMSToastr.notification(c)
        });
    } else {
        SMSToastr.notification(message)
    }

}

