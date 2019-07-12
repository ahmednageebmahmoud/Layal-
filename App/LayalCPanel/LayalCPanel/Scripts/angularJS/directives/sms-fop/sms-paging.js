/*
هذة الديركطتف هى المسؤلة عن ريم الفوتر الخاص بـ التصفح
وما يلى الاتربيوت المراد اضافتها فى الديركتيف

  
ng-sms-fop : هذة الكلاس التى تحمل كل الوظائف التى تستخدم فى الترتيب والفيلتر وخلافة 


Example full Elemnt
<sms-pageing ng-sms-fop="groupFOP"
ng-sms-display-m-func
></sms-pageing>

*/

ngApp.directive('smsPaging', function ($compile) {
		return {
			restrict: 'E',
			replace: true,
			link: function ($scope, element, attrs) {
				let fopObjec = attrs.ngSmsFop;
                let displayMoreFunction = attrs.ngSmsDisplayMFunc;
                element.html(`
                        <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12 col-md-5">
                                    <div class="dataTables_info"
                                         id="kt_table_2_info" role="status"
                                         aria-live="polite">${Token.showing} {{${fopObjec}.paging.from}} ${Token.to} {{${fopObjec}.paging.to}} ${Token.of} {{${fopObjec}.paging.itemsCount}}</div>
                                </div>
                                <div class="col-sm-12 col-md-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="kt_table_2_paginate">
                                        <ul class="pagination float-right">
                                            <li class="paginate_button page-item previous  prev" ng-class="{'disabled':!${fopObjec}.paging.allowPreviousPage}" ng-click="${fopObjec}.paging.gotoPreviousPage()"><a href=javascript:void(0) aria-controls="kt_table_2" data-dt-idx="0" tabindex="0" class="page-link"><i class="la la-angle-left"></i></a></li>
                                        	<li class="paginate_button page-item "
                                                ng-repeat="pag in ${fopObjec}.paging.pages | limitTo:${fopObjec}.paging.limitPagesTake:${fopObjec}.paging.limitPagesSkip track by $index" ng-class="{'active':pag==${fopObjec}.paging.currentPage}">
                                                <a href=javascript:void(0) class="page-link" ng-click="${fopObjec}.paging.gotoPage(pag)">{{pag}}</a></li>

                                            <li class="paginate_button page-item next" id="kt_table_2_next" ng-class="{'disabled':!${fopObjec}.paging.allowNextPage}" ng-click="${fopObjec}.paging.gotoNextPage()">
                                                        <a href=javascript:void(0)  class="page-link"><i class="la la-angle-right"></i></a></li>
											${displayMoreFunction ? `<li class="paginate_button page-item " ng-click="${displayMoreFunction}"><a class="page-link"> ${Token.displayMore}</a></li>` : ``}
                                    

                                          </ul>
                                    </div>
                                </div>
                            </div>
                        </div>`);

				//element.html(
				//	`<div class="row DTTTFooter"   >
				//					<div class="col-sm-6">
				//						<div class="dataTables_info">${Token.showing} {{${fopObjec}.paging.from}} ${Token.to} {{${fopObjec}.paging.to}} ${Token.of} {{${fopObjec}.paging.itemsCount}}</div>
				//					</div>
				//					<div class="col-sm-6">
				//						<div class="dataTables_paginate paging_bootstrap" id="editabledatatable_paginate">
				//							<ul class="pagination">
				//								<li class="cursor-pointer prev" ng-class="{'disabled':!${fopObjec}.paging.allowPreviousPage}" ng-click="${fopObjec}.paging.gotoPreviousPage()"><a> ${Token.previous}</a></li>
				//								<li class="cursor-pointer" ng-repeat="pag in ${fopObjec}.paging.pages | limitTo:${fopObjec}.paging.limitPagesTake:${fopObjec}.paging.limitPagesSkip track by $index" ng-class="{'active':pag==${fopObjec}.paging.currentPage}"><a ng-click="${fopObjec}.paging.gotoPage(pag)">{{pag}}</a></li>
                //						
                //                                <li class="cursor-pointer next" ng-class="{'disabled':!${fopObjec}.paging.allowNextPage}" ng-click="${fopObjec}.paging.gotoNextPage()"><a> ${Token.next}</a></li>
				//							${displayMoreFunction?`<li class="cursor-pointer" ng-click="${displayMoreFunction}"><a> ${Token.displayMore}</a></li>`:``}
				//							</ul>
				//						</div>
				//					</div>
				//		</div>`);

				//الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
				$compile(element.contents())($scope)
			}

		}
	});