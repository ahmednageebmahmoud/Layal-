/**
 * class state enum with property get only 
 */
class StateEnum {
    static get create() { return 1; };
    static get update() { return 2; };
    static get delete () { return 3; };
    static get approve() { return 4; };
    static get cancel() { return 5; };
}


/**
 * request type enum
 */
class RequestTypeEnum {
    static get sucess() { return 1; };
    static get error() { return 2; };
    static get warning() { return 3; };
    static get info() { return 4; };
}




/**
 * elements type
 */
class ElementTypesEnum {

    static get text() { return 1; };
    static get number() { return 2; };
    static get select() { return 3; };
    static get chekcBox() { return 4; };
    static get date() { return 5; };
    static get time() { return 6; };
    static get file() { return 7; };
    static get RichBox() { return 8; };


    /*List Elemt Type*/
    static get listElentTypes() {
        return [
            {
                Id: this.text, Name: Token.element_text
            },
            {
                Id: this.number, Name: Token.element_number
            },
            {
                Id: this.select, Name: Token.element_select
            },
            {
                Id: this.chekcBox, Name: Token.element_chekcBox
            },
            {
                Id: this.date, Name: Token.element_date
            },
            {
                Id: this.time, Name: Token.element_time
            },
            {
                Id: this.file, Name: Token.element_file
            },
            {
                Id: this.RichBox, Name: Token.element_RichBox
            },

        ]
    };

}

/**
 * files types
 */
class FileTypesEnum {

    static get image() { return 1; };
    static get pdf() { return 2; };
    static get word() { return 3; };


    /*List Elemt Type*/
    static get listFileTypes() {
        return [
            {
                Id: this.image, Name: Token.file_image, Extensions: "image/*", fontawesome: "fa-picture-o"
            },
            {
                Id: this.pdf, Name: Token.file_pdf, Extensions: ".pdf", fontawesome: " fa-file-pdf-o"
            },
            {
                Id: this.word, Name: Token.file_word, Extensions: ".doc,.docx", fontawesome: "fa-file-word-o"
            }
        ]
    };

}


class worksTypesEnnum {
    
    static get Coordination() { return 3 };
    static get Implementation() { return  4};
    static get ArchivingAndSaveing() { return 5 };
    static get ProductProcessing() { return 6 };
    static get Chooseing() { return 7 };
    static get DigitalProcessing() { return 8 };
    static get PreparingForPrinting() { return 9 };
    static get Manufacturing() { return 10 };
    static get QualityAndReview() { return 11 };
    static get Packaging() { return 12 };
    static get TransmissionAndDelivery() { return 13 };
    static get Archiving() { return 14 }
};

 

class AccountTypesEnum {
    static get ProjectManger() { return 2 };
    static get Supervisor() { return 2 };
    static get BranchManager() { return 3 };

    static get Clinet() { return 4 };
    static get Employee() { return 5 };
    static get Helper() { return 6 };
    static get Photographer() { return 7 };
};

var accountTypesList=
[
   { Id: null, AccountTypeName: Token.select },
   { Id: AccountTypesEnum.ProjectManger, AccountTypeName: LangIsEn ? "Project Manger" : "مدير المشروع" },
   { Id: AccountTypesEnum.Supervisor, AccountTypeName: LangIsEn ? "Supervisor" : "مشرف" },
   { Id: AccountTypesEnum.BranchManager, AccountTypeName: LangIsEn ? "Branch Manager" : "مدير فرع" },
   { Id: AccountTypesEnum.Clinet, AccountTypeName: LangIsEn ? "Clinet" : "عميل" },
   { Id: AccountTypesEnum.Employee, AccountTypeName: LangIsEn ? "Employee" : "موظف" },
   { Id: AccountTypesEnum.Helper, AccountTypeName: LangIsEn ? "Helper" : "متعاون" },
   { Id: AccountTypesEnum.Photographer, AccountTypeName: LangIsEn ? "Photographer" : "مصور" },
];
var workTypesList = [
     { Id: 3, WorkTypeName: LangIsEn ? 'Coordination' : 'الاعداد والتنسيق' },
     { Id: 4, WorkTypeName: LangIsEn ? 'Implementation' : 'التنفيذ' },
     { Id: 5, WorkTypeName: LangIsEn ? 'Archiving and Saveing' : 'الأرشفة و الحفظ	' },
     { Id: 6, WorkTypeName: LangIsEn ? 'Product processing' : 'تجهيز المنتاجات' },
     { Id: 7, WorkTypeName: LangIsEn ? 'Chooseing' : 'الاختيار' },
     { Id: 8, WorkTypeName: LangIsEn ? 'Digital processing' : 'المعالجة الرقمية' },
     { Id: 9, WorkTypeName: LangIsEn ? 'Preparing for printing' : 'الاعداد للطباعة	' },
     { Id: 10, WorkTypeName: LangIsEn ? 'Manufacturing' : 'التصنيع' },
     { Id: 11, WorkTypeName: LangIsEn ? 'Quality and review' : 'الجودة و المراجعة' },
     { Id: 12, WorkTypeName: LangIsEn ? 'Packaging' : 'التغليف' },
     { Id: 13, WorkTypeName: LangIsEn ? 'Transmission and delivery  ' : 'الارسال و التسليم' },
     { Id: 14, WorkTypeName: LangIsEn ? 'Archiving' : 'الأرشفة' },
];