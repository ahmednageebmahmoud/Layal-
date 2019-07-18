/*
هنا نقوم بت ارجاع جميع العناصر معادا العناصر التى حذفت
*/

ngApp.filter('employeeWorkFilter', function () {
	return function (items,workTypeId) {
	    
	    if (!items||!Array.isArray(items)) return items;
	   

	    return items.filter(c=> c.Id==null|| c.WorkTypes.filter(v=> v.Id=workTypeId).length>0);
	};
});