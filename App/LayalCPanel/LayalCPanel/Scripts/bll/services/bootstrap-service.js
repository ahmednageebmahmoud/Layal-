 
/**
 * show bootstrap dilog
 * @param {string} template pass your template after compile by angualr 
 * @param {string} dilogName dilog title (send me resources key or direct value) 
 * @param {string} lblBtnSucess button sucess lable (send me resources key or direct value)
 * @param {string} lblBtnDanger buton close lable (send me resources key or direct value)
 * @param {function} callBackSucess call back function if resolve and must be return true or false for cloes dilog
 * @param {function} callBackClose  call back function if reject and must be return true or false for cloes dilog
 * @param {function} callBackError  call back function if reject and must be return true or false for cloes dilog
 */

function showDilog(  template, dilogName, lblBtnSucess, lblBtnDanger, callBackSucess, callBackClose, callBackError) {
    try {

        bootbox.dialog({
            message: template,
            title: dilogName,
            className: "modal-darkorange",
            buttons: {
                success: {
                    label:  lblBtnSucess,
                    className: "btn-blue",
                    callback: () => {
                        return callBackSucess(true);
                    }
                },
                Danger: {
                    label: lblBtnDanger,
                    className: "btn-danger",
                    callback: () => {
                        return callBackClose(false)
                    }
                }
            }
        });
    } catch (e) {
        //Some Error
        callBackError(false);
    }
}




/**
 * Element Modle Id
 * @param {string} elemtnId
 */
function bootstrapModelShow(elemtnId) {
    $(`#${elemtnId}`).modal({ keyboard: true, backdrop: true });
}


/**
 * Element Modle Id
 * @param {string} elemtnId
 */
function bootstrapModelHide(elemtnId) {
    $(`#${elemtnId}`).modal('hide');
}
