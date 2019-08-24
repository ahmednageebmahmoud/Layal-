/*
هنا نقوم بت ارجاع جميع العناصر معادا العناصر التى حذفت
*/

ngApp.filter('filterWithoutStaticItems', function () {
	return function (items,obj) {
	    
	    if (!items||!Array.isArray(items)) return items;
	    var keys = Object.keys(obj);
	    var returnItems = [];
	    keys.forEach(key=> {
	        returnItems = returnItems.concat(items.filter(c =>  c[key] == obj[key] || c.Id == null || c.Id == 0));
	    });

	    return returnItems;
	};
});