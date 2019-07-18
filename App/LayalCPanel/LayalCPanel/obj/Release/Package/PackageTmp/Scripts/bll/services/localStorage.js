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




}