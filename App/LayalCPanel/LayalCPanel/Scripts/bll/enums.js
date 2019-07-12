/**
 * class state enum with property get only 
 */
class StateEnum {
    static get create() { return 1; };
    static get update() { return 2; };
    static get delete() { return 3; };
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


/**
 * Pages Enum
 */
class PagesEnum {

    static get countries () { return  1};
    static get cities () { return  2};
    static get jobs () { return  3};
    static get roles () { return  4};
    static get nationalities () { return  5};
    static get coursesType () { return  6};
    static get courses () { return  7};
    static get departments () { return  8};
    static get quafilications () { return  9};
    static get employees () { return  10};
    static get employeeStatus () { return  11};
    static get deductionreasons () { return  12};
    static get deductions () { return  13};
    static get incentiveTypes () { return  14};
    static get incentives () { return  15};
    static get templates () { return  16};
    static get groups () { return  17};
    static get documentsReports () { return  18};
    static get usersPagesPrivileges () { return  19};
    static get languages () { return  20};
    static get languageSkills () { return  21};
    static get managments () { return  22};
    static get organizationStructural () { return  23};
    static get vacationTypes () { return  24};
    static get vacations () { return  25};
    static get insurancecategories () { return  26};
    static get relationTypes () { return  27};
    static get documents () { return  28};
    static get employeePermissions () { return  29};
    static get employeeQuite () { return  30};
    static get vacationSettings () { return  31};
    static get grades () { return  32};
    static get skills () { return  33};


}



class WorkFlowStatusEnum {
    static get Approved() { return 1; };
    static get Reject() { return 2; };
    static get Cancel() { return 3; };
    static get Postponement() { return 4; };
}



class EmployeeStatusEnum {


    static get Active() { return 1; };
    static get Quit() { return 2; };
    static get Terminate() { return 3; };
    static get Die() { return 4; };
    static get V() { return 5; };
    static get Left() { return 6; };
}




class StudyStateEnum {


    static get PerDay() { return 1; };
    static get PerWeek() { return 2; };
    static get Permonth() { return 3; };
    static get PerQuarter() { return 4; };
    static get Persemester() { return 5; };
    static get PerAcademic() { return 6; };
}

