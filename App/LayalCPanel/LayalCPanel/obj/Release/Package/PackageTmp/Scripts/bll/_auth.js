 
keyUserInfo = "userInfo";
class Auth {
   
    //الحصول على جميع معلومات المستخدم
    static get userInfromation()
    {
        return JSON.parse(window.localStorage.getItem(keyUserInfo));
    }

    //اضافة بيانات المستخدم الى المخزن
    static addUserInformation(userInfro) {
        if (!userInfro)
            return;
        window.localStorage.setItem(keyUserInfo, JSON.stringify(userInfro));
    };

    //تسجيل الخروج
    static logOut() {
        window.localStorage.clear();
    }
}