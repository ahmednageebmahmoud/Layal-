/*
هنا نقوم بت ارجاع جميع العناصر معادا العناصر التى حذفت
*/

ngApp.filter('FilterWithoutDelete', function () {
	return function (items) {
	    
	    if (!items||!Array.isArray(items)) return items;

	    return items.filter(c=> c.State!=StateEnum.delete);
	};
});


