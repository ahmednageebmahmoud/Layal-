class DateTimeService {
    /**
     * هذة الدالة سوف تقوم بتحويل التاريخ من انجليزى الى عربى بـ فورمات السعودية 
     * @param {any} javascriptDate تاريخ بفورمات الجافا اسكريبت وليس السى شارب
     */
    static getDate(javascriptDate) {
        var date = new Date(javascriptDate);
        if (LangIsEn)
        {
            return date.toLocaleDateString('us-en')

        } else {
            return date.toLocaleDateString('ar-sa');
        }
    }

   /**
    * نقوم بـ ارجاع التاريخ بـ الفورمات النجليزى على اى حال
    * @param {any} javascriptDate
    */
    static getEnglishDate(javascriptDate) {
        var date = new Date(javascriptDate);
            return date.toLocaleDateString('ar-sa');
    }
}