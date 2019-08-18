/*
هنا نقوم بت ارجاع جميع العناصر معادا العناصر التى حذفت
*/

ngApp.filter('employeeWorkFilter', function () {
	return function (items,workTypeId,onlyIsBasicBranch) {
	    
	    if (!items||!Array.isArray(items)) return items;
	   
       if(onlyIsBasicBranch)
	    return items.filter(c=>
            //For Select
	        c.Id == null ||
            (
            c.IsBasicBranch &&
                //Filter Now
                c.WorkTypes.filter(v=> v.Id == workTypeId).length > 0));
	    else
           return items.filter(c=>
               //For Select
               c.Id == null ||
                   //Filter Now
                   c.WorkTypes.filter(v=> v.Id == workTypeId).length > 0);
	};
});