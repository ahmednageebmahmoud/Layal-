/*
هنا نقوم بت ارجاع جميع العناصر معادا العناصر التى حذفت
*/

ngApp.filter('spliting', function () {
	return function (items,splitingCount,partNumber) {
	    if (!items||!Array.isArray(items)) return items;

	    let groupCount = (items.length / 2);
	    if (partNumber == 1)
	        return items.slice(0, groupCount * partNumber);
	    else
	        return items.slice(groupCount, groupCount * partNumber);

	    return items;
	};
});


