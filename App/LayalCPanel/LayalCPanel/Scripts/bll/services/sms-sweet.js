﻿class SMSSweet {

    /**
    * For Show Alert Deleting
    */
    static delete(okFunCallback, cancelFuncCallback, message) {
        new Audio('/assets/sound/sweetAlert.mp3').play();

      
        swal.fire({
            title: message || Token.deleteMessageConfirmation + ' ',
            text: "",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: Token.ok,
            cancelButtonText: Token.cancel,
            reverseButtons: true
        }).then(function (result) {
            if (result.value) {
                okFunCallback();
            } else if (result.dismiss === 'cancel') {
                swal.fire(Token.cancelled, '', 'error');
                if (cancelFuncCallback)
                    cancelFuncCallback();
            }
        });
    }

    //Confirm Alert Info
    static confirmInfo(message,okFunCallback,cancelFuncCallback) {
        new Audio('/assets/sound/sweetAlert.mp3').play();

               
        swal.fire({
            title:'',
            text: message ,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: Token.ok,
            cancelButtonText: Token.cancel,
            reverseButtons: true
        }).then(function (result) {
            if (result.value) {
                okFunCallback();
            } else if (result.dismiss === 'cancel') {
                swal.fire(Token.cancelled, '', 'error');
                if (cancelFuncCallback)
                    cancelFuncCallback();
            }
        });
    }

    /**
     * Confirm Alert With Custom Btn Titles
     * @param {any} message   Message
     * @param {any} okTitle   Ok Title
     * @param {any} cancelTitle  Cancel Title
     * @param {any} okFunCallback  Ok Function
     * @param {any} cancelFuncCallback Cancel Function
     */
    static confirmInfoV2(message,okTitle,cancelTitle, okFunCallback, cancelFuncCallback) {
        new Audio('/assets/sound/sweetAlert.mp3').play();
        swal.fire({
            title: Token.success,
            text: message,
            type: 'success',
            showCancelButton: true,
            confirmButtonText: okTitle|| Token.ok,
            cancelButtonText: cancelTitle||Token.cancel,
            reverseButtons: true
        }).then(function (result) {
            if (result.value) {
                okFunCallback();
            } else if (result.dismiss === 'cancel') {
                swal.fire(Token.cancelled, '', 'error');
                if (cancelFuncCallback)
                    cancelFuncCallback();
            }
        });
    }


    static alert(message, requestType, callBack) {
        new Audio('/assets/sound/sweetAlert.mp3').play();
        switch (requestType) {
            case RequestTypeEnum.sucess:
                swal.fire(Token.suucess, message, "success")
                    .then(function (result) {
                        callBack();
                    });
                break;
            case RequestTypeEnum.error:
                swal.fire(Token.error, message, "error").then(function (result) {
                    callBack();
                });
                break;
            case RequestTypeEnum.warning:
                swal.fire(Token.warning, message, "warning").then(function (result) {
                    callBack();
                });
                break;
            case RequestTypeEnum.info:
                swal.fire(Token.info, message, "info").then(function (result) {
                    callBack();
                });
                break;
        }
    }



}