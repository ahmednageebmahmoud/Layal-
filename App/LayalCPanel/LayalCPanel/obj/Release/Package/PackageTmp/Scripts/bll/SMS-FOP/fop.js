/**
	 * FOP : Filter OrderBy Paging
 *
 */
class FOP {

    reFop(itemsCount, takeItemsCount) {

        this.itemsCount = itemsCount || this.itemsCount;
        this.takeItemsCount = takeItemsCount || this.takeItemsCount;
        this.paging.pagination(this.itemsCount, this.takeItemsCount);

    }

	/**
	 * FOP : Filter OrderBy Paging
	 * @param {any} itemsCount عدد العناصر 
	 * @param {any} take عدد العناصر المراد عرضها فى الصفحة الواحدة
	 */
    constructor(itemsCount, currentPageNumber, limitPagesTakeC, limitPagesSkipC) {

        //نقوم بـ التالى بحيث عند تزويد الداتا لا نرحع الى اول صفحة لا نثق عند آخر صفحة وايضا نظهر نفس مجموعة ارقام الصفح
        let currentPageNo = currentPageNumber || 1;
        let limitPagesTake = limitPagesTakeC || 5;
        let limitPagesSkip = limitPagesSkipC || 0;



        //count item show to in one page
        this.takeItemsCount = Defaults.takeForDisPlayItemsInTable;
        //items count(length of array)
        this.itemsCount = itemsCount;
        //Paging
        this.paging = new Paging(1, this.takeItemsCount, this.takeItemsCount , itemsCount, currentPageNo, true, false, limitPagesTake, limitPagesSkip);
        //sort
        this.sort = new Sort(null, null);

    }
}