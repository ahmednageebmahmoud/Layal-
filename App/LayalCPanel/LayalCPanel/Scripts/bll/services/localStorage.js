class LocalStorageService
{
    static get  menus() {
        var menus = localStorage.getItem("Menus");
        if(!menus)return null;
            return JSON.parse(menus);
    }

    static set menus(mens) {
        return localStorage.setItem("Menus", JSON.stringify(mens));
    }

    /*
    حفظ معلومات المستخدم التى سوف تعرض فى الصفحة الشخصية 
    */
    static set userHomeInformation(data) {
        return localStorage.setItem("UserHomeInformaiton", JSON.stringify(data));
    }
    static get  userHomeInformation() {
        var data = localStorage.getItem("UserHomeInformaiton");
        if (!data) return null;
        return JSON.parse(data);
    }

    /*
    الرسم البيانى لـ رضاء العملاء
    */
        //Set satisfied Chart In Loacl Sorage
    static set satisfiedChart(data) {
        return localStorage.setItem("satisfiedChart", JSON.stringify(data));
    }
                    //Get satisfied Chart In Loacl Sorage
    static get  satisfiedChart() {
        var data = localStorage.getItem("satisfiedChart");
        if (!data) return null;
        return JSON.parse(data);
    }


}