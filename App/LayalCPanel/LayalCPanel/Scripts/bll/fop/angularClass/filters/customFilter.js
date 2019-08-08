/*
فى هذة الفيلتر نقوم  بعمل فيلتر فقط للعناصر المعروضة

*/
ngApp.filter('customFilter', function ($filter) {

    return function (items, condetion, fop, fopObjectName, scope) {
        if (!items || !condetion || !fopObjectName || !scope) return items;

        //جلب الحصول على الذى فيط تعرض فى الجدول 
        fildesUsed = scope[`fildes_${fopObjectName}`];
        //اذا لم يكن هناك حقول فـ نرجع لـ الداتا مباشرة
        if (!fildesUsed) return items;




        //Generate Custom Object Search
        let valus = [];
        fildesUsed.forEach(feild => {
            let objSerarch = { feild: condetion };

            //   console.log($filter('filter')(items, feild, condetion))
        });


        //نقوم الان بعملية الفيلتر
        var returntItems = filterArray(items, condetion, fildesUsed);

        //نقوم بتحديث الصففحات وعدد ترقيم الصفحات وخلاقة 
        fop.reFop(returntItems.length);

        //نرجع الان بـ الداتا المفتلرة 
        return returntItems;
    };
});

/**
 * اتمام عغملية الفلترة  
 * @param {any} items العناصر الذى سوف تفلتر
 * @param {any} condetion الشرط
 * @param {any} fildesUsed الحقول الذى سوف نبحث بها
 */
function filterArray(items, condetion, fildesUsed) {
    let vrtial = [];

    items.filter(c => {
    
                   //this is object
        let inserted = false;

        Object.getOwnPropertyNames(c)
            .forEach(prop => {
                if (!c[prop])
                    return;
                //check if array
                if (c[prop].constructor === Array) {
                    //this is array
                    vrtial = vrtial.concat(filterArray(c[prop], condetion, fildesUsed));
                }
                else if (typeof (c[prop]) === "object") {
                        try {
                            Object.getOwnPropertyNames(c[prop]).forEach(newProp=>{
                                
                                if (fildesUsed.filter(v => v.toLocaleLowerCase() == newProp.toLocaleLowerCase()).length == 0) return;


                            fildesUsed.forEach(feild => {
                                if (!c[prop][newProp].toString().toLowerCase().includes(condetion.toLowerCase())) return;
                                inserted = true;
                            });

                            })
                        } catch (e) {

                        }
                }
                else {
                  

                    if (fildesUsed.filter(v => v.toLocaleLowerCase() == prop.toLocaleLowerCase()).length == 0) return;

                    fildesUsed.forEach(feild => {

                        if (!c[prop].toString().toLowerCase().includes(condetion.toLowerCase()))
                            return;
                        inserted = true;
                    });
                    
                }
            });
        if (inserted)
            vrtial.push(c);
    });
    return vrtial;
}
function filterInObject() {



}