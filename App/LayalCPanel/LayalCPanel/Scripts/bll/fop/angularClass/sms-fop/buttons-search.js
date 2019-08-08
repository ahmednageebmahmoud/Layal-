 /*
من اجل اضافة ازر الطباعة وتحميل الايكسل ومربع البحث وخلافة

*/

ngApp.directive('smsButtonsSearch', function ($compile) {
	return {
		restrict: 'E',
		replace: true,
		link: function ($scope, element, attrs) {
			let fopObjec = attrs.ngSmsFop;
			element.html(
				`<div class="row">
                                <!--Search-->
                            <div class="col-sm-6 text-left">
                                <div class="dataTables_filter">
                                  <label>

                                        <input type="search" class="form-control form-control-sm" 
                                               placeholder="${LangIsEn?"Search ...":"بحث ..."}" aria-controls="kt_table_1" ng-model="${attrs.ngSmsSearchModel}"/>
                                  </label>
                                   
                                </div>
                            </div>
                            <!--Print And More-->
                            <div class="col-sm-6 text-right">
                                <div class="dt-buttons btn-group">
                                    <button class="btn btn-secondary buttons-print" tabindex="0" aria-controls="kt_table_1" type="button" onClick="SmsButtons.tablePrint('${attrs.ngSmsTableid}')"><span>Print</span></button>
                                    <button class="btn btn-secondary buttons-copy buttons-html5 ${attrs.ngSmsTableid}" tabindex="0" aria-controls="kt_table_1" type="button" data-clipboard-target="#${attrs.ngSmsTableid}"   onClick="SmsButtons.tableToClipboard('.${attrs.ngSmsTableid}')"><span>Copy</span></button>


                                    <button class="btn btn-secondary buttons-cvs buttons-html5" tabindex="0" aria-controls="kt_table_1" type="button" onClick="SmsButtons.tableCSVDownlaod('${attrs.ngSmsTableid}')"><span>CVS</span></button>
                                    <button class="btn btn-secondary buttons-excel buttons-html5" tabindex="0" aria-controls="kt_table_1" type="button" onClick="SmsButtons.tableToExcel('${attrs.ngSmsTableid}')"><span>Excel</span></button>
                                    <button class="btn btn-secondary buttons-pdf buttons-html5" tabindex="0" aria-controls="kt_table_1" type="button" onClick="SmsButtons.tableJsonDownlaod('${attrs.ngSmsTableid}')"><span>JSON</span></button> 

                                </div>
                            </div>
                        </div>`);

                     ///               <button class="btn btn-secondary buttons-pdf buttons-html5" tabindex="0" aria-controls="kt_table_1" type="button" onClick="SmsButtons.tablePDFDownlaod('${attrs.ngSmsTableid}')"><span>PDF</span></button>
            

			//الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
			$compile(element.contents())($scope)
		}

	}
});


 























































