/**
 * retutn true if user language  english
 */
 
/**
 * Return Count Of Items Not has State Delete
 
 */
function lengthWithOutDeleted(items) {

    if (!items)
        return 0;

    return items.filter(c => c.State != StateEnum.delete).length;

}


function co(title, data) {
    console.log(`<!========> ${title}`);
    console.log(data);
    console.log(`</========>`);

    //console.log(`<!======== ${title} ========>`);
    //console.log(data);
    //console.log(`</======== ${title} ========>`);
}

var queriesValues = [];
/**
 * Get Query String Value


 */
function getQueryStringValue(queryKey) {
    //لا نقوم بعمل هذة العملية الا مرة واحدة لذالك يجب التحقق 
    if (queriesValues.length == 0) {

        var queries = window.location.search.replace('?', '').split('&');

        if (!queries || queries.length == 0) {
            alert('No Queries Found');
            return;
        }

        queries.forEach(c => {
            let key = c.split('=')[0];
            let value = c.split('=')[1];
            let queryObj = { key, value }
            queriesValues.push(queryObj)


        });
    }

    let query = queriesValues.find(v => v.key == queryKey);
    if (!query) {
        console.error(`Query  ${queryKey} Not Found`);

    } else {
        return query.value;
    }
}


/**
 * Check If Dublicated Value 
 * @param {Array} items
 * @param {object} props
 */
function isDuplicated(items, props) {
    if (!items || items.length == 0) return false;
    if (!props) return false;

    let keys = Object.keys(props);

    //array bool for saved result true or false
    var arryResult = [];

    items.forEach(item => {
        var arryResultSpcifc = [];

        keys.forEach(key => {
            arryResultSpcifc.push(item[key] === props[key]);
        });

        //push false if not everything true
        arryResult.push(arryResultSpcifc.findIndex(res => res == false) === -1);
    });

    //return false if not everything true
    return arryResult.findIndex(c => c == true) >= 0;
}


/**
 * Check If Dublicated Value without item state deleted
 * @param {Array} items
 * @param {object} props
 */
function isDuplicatedWithoutDeleted(items, props) {
    if (!items || items.length == 0) return false;
    if (!props) return false;

    let keys = Object.keys(props);

    //array bool for saved result true or false
    var arryResult = [];

    items.filter(c => c.State != StateEnum.delete).forEach(item => {
        var arryResultSpcifc = [];

        keys.forEach(key => {
            arryResultSpcifc.push(item[key] === props[key]);
        });

        //push false if not everything true
        arryResult.push(arryResultSpcifc.findIndex(res => res == false) === -1);
    });

    //return false if not everything true
    return arryResult.findIndex(c => c == true) >= 0;
}

/**
 * array filter items
 * @param {Array} items
 * @param {function} condetionFunc
 * @returns {Array}
 */
function filterItems(items, condetionFunc) {
    if (!Array.isArray(items))
        return [];

    if (items.length == 0) return items;
    if (!condetionFunc) return items;

    return items.filter(c => condetionFunc(c));
}



/**
 * Update Page Title
 * @param {string} newTitle
 */
function updatePageTitle(newTitle) {
    if (!newTitle) return;
    document.title = newTitle;
}


/**
 * trim all spaces in text
 * @param {string} text
 */
function smsTrim(text) {
    if (!text) return "";
    return text.replace(/\s/g, '');
}


/**
 * Get File Base 64
 * @param {File} file
 */
function getFileBase64(file) {

    return new Promise((resolv, reject) => {
        try {

            var reder = new FileReader();

            reder.onload = (event) => {
                resolv(event.target.result.replace(/^data:image\/[a-z]+;base64,/, ""));
            };
            reder.readAsDataURL(file);

        } catch (e) {
            reject(e);
        }

    });
}


/**
 * convert Date Time For C# DateTime as "mm/dd/yyy"
 * @param {Date} date
 */
function convertDateTimeToString(dateTime) {
    if (!dateTime)
        return "";
    //  var myDateTime = new Date(dateTime);
    return `${dateTime.getMonth() + 1}/${dateTime.getDate()}/${dateTime.getFullYear()}`;
}



/**
 * get current mvc controller
 */
function getcurrentController(url) {
    var pathSplit = window.location.href.split(window.location.origin);

    if (pathSplit.length < 1)
        return "";
    return pathSplit[1].split('/')[1];
}


function checkInputRTL(s) {
    var ltrChars = 'A-Za-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02B8\u0300-\u0590\u0800-\u1FFF' + '\u2C00-\uFB1C\uFDFE-\uFE6F\uFEFD-\uFFFF',
        rtlChars = '\u0591-\u07FF\uFB1D-\uFDFD\uFE70-\uFEFC',
        rtlDirCheck = new RegExp('^[^' + ltrChars + ']*[' + rtlChars + ']');

    return rtlDirCheck.test(s);
};



function animatedElement(selctor,animatedClass)
{
    $(selctor).removeClass(animatedClass).addClass('animated').addClass(animatedClass);
}

function selectTo(timeOut) {
    setTimeout(() => {
        $("select[serchbale]").select2();
    }, timeOut||1000)
}

function myAutoSize() {
    setTimeout(() => {

    var demo1 = $('[autosize]');
    autosize(demo1);
    autosize.update(demo1);
    },1000)
}