class UsersPagesPrivileges {
    constructor(_CanDisplay, _CanAdd, _CanEdit, _CanDelete) {
        this.CanDisplay = _CanDisplay.toLocaleLowerCase()=="true";
        this.CanAdd = _CanAdd.toLocaleLowerCase() == "true";
        this.CanEdit = _CanEdit.toLocaleLowerCase() == "true";
        this.CanDelete = _CanDelete.toLocaleLowerCase() == "true";
    }
}