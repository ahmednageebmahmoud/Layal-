class Defaults{
    //عدد العناصر الذى سوف تعرض داخل الجدول
    static get takeForDisPlayItemsInTable() { return 10 }
    //عدد العناصر الذى سوف يت تحميلها من السيرفر
    static get takeFromServer() { return 30 }


}
Defaults.defultSelectOptionRole = { Id: null, RoleName: Token.select };
Defaults.defultSelectOption = { Id: null, Name: Token.select };
