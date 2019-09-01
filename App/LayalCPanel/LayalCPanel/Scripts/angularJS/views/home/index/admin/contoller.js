ngApp.controller('homeCtrl', ['$scope', '$http', 'homeServ','$rootScope', function (s, h, homeServ,rs) {




    //============= G E T =================
    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();

        homeServ.getItems().then(d => {
            loading.hide();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.chart= d.data.Result.EventSurveiesChart;
                    
                    //Save satisfied Chart In Loacl Sorage
                    LocalStorageService.satisfiedChart = s.chart;
                    s.satisfiedChart();

                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getItemsHome", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getItemsHome", err);
        })
    };

    //رسم الرسم البيانى 
    s.satisfiedChart = () => {
        if (!s.chart) return;
        var currentMonthIndex = new Date().getMonth()+1;

        var ctx = document.getElementById("satisfiedChart").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#d1f1ec').alpha(1).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#d1f1ec').alpha(0.3).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: [
                    LangIsEn ? "January" : "يناير",
                    LangIsEn ? "February" : "فبراير",
                    LangIsEn ? "March" : "مارس",
                    LangIsEn ? "April" : "ابريل",
                    LangIsEn ? "May" : "مايو",
                    LangIsEn ? "June" : "يونو",
                    LangIsEn ? "July" : "يوليو",
                    LangIsEn ? "August" : "اغسطس",
                    LangIsEn ? "september" : "سبتمبر",
                    LangIsEn ? "October" : "اكتوبر",
                    LangIsEn ? "November" : "نوفمبر",
                    LangIsEn ? "December" : "ديسمبر"
                ].slice(0, currentMonthIndex),//نعرض فقط الى الشهر الحالى وهذا الوضع يسير اذا كان التقرير يظهر للسن 
                datasets: [{
                    label: LangIsEn ? "Number of satisfaction" : "عدد الرضا",
                    backgroundColor: gradient,
                    borderColor: KTApp.getStateColor('success'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: KTApp.getStateColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),

                    //fill: 'start',
                    data: [
                        s.chart.Month1,
                        s.chart.Month2,
                        s.chart.Month3,
                        s.chart.Month4,
                        s.chart.Month5,
                        s.chart.Month6,
                        s.chart.Month7,
                        s.chart.Month8,
                        s.chart.Month9,
                        s.chart.Month10,
                        s.chart.Month11,
                        s.chart.Month12,
                    ].slice(0, currentMonthIndex)//نعرض الاحصائيات لحد الشهر الحالى
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }



    //=-=-=-=-=-=-= Other =-=-=-=-=--=-
    //Get satisfied Chart In Loacl Sorage
    s.chart = LocalStorageService.satisfiedChart;
    s.satisfiedChart();

    //-=-=-=-=-=- Call Functions -=-=-=-=- 
    s.getItems();
}]);