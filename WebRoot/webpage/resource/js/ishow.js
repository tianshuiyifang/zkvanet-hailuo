$(function () {
	
	/**
	 * 在网设备上线率
	 */
	var deviceCount=[];
	deviceCount=[
	                ['运行',   20],
	                ['离线',   10],
	                ['静止',    8]
	            ]
    $('.zonghetongji').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: null
        },
        credits: {
            enabled: false
        },
        exporting:{  
        	enabled:false 
        	},  
        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                	 enabled: true,
                     format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                     style: {
                         color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                },
                showInLegend: true
            }
            }
        },
        series: [{
            type: 'pie',
            name: '在网车辆统计',
            data: deviceCount
        }]
    });
    
	/**
	 * 在网设备出场率
	 */
	var chuchanglv=[];
	chuchanglv=[
	                ['出场',   20],
	                ['未出场',   10]
	            ]
    $('.chuchanglv').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: null
        },
        credits: {
            enabled: false
        },
        exporting:{  
        	enabled:false 
        	},  
        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                	 enabled: true,
                     format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                     style: {
                         color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                },
                showInLegend: true
            }
            }
        },
        series: [{
            type: 'pie',
            name: '在网设备出场率',
            data: chuchanglv
        }]
    });
	
	
    /**
     *  厂商车辆统计
     */
    var devicedata=[];
    var drilldowndata=[];
    devicedata = [{
        name: '马鞍山海螺',
        y: 5,
        drilldown: 'maanshanghailuo'
    }, {
        name: '白马山',
        y: 5,
        drilldown: 'baimashang'
    }, {
        name: '全椒海螺',
        y: 5,
        drilldown: 'quanjiahailuo'
    }];
    drilldowndata=[{
        name: 'maanshanghailuo',
        id: 'maanshanghailuo',
        data: [
            [
                '行驶',
                0
            ],
            [
                '静止',
                0
            ],
            [
                '离线',
                5
            ]
        ]
    }, {
        name: 'baimashang',
        id: 'baimashang',
        data: [
             [
                '行驶',
                0
            ],
            [
                '静止',
                3
            ],
            [
                '离线',
                2
            ]
        ]
    }, {
        name: 'quanjiahailuo',
        id: 'quanjiahailuo',
        data: [
               [
                '行驶',
                1
            ],
            [
                '静止',
                3
            ],
            [
                '离线',
                1
            ]
        ]
    }];
    // Create the chart
    $('.order-1').highcharts({
        chart: {
            type: 'column'
        },
        credits: {
            enabled: false
        },
        exporting:{  
        	enabled:false 
        },  
        title: {
            text: null
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: '车辆总数'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y}'
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b>辆<br/>'
        },
        series: [{
            name: '厂商',
            colorByPoint: true,
            data: devicedata
        }],
        drilldown: {
            series:drilldowndata
        }
    });
    
    /**
     * 厂商订单统计
     */
    var orderdata=[];
    var drilldownorder=[];
    orderdata = [{
        name: '马鞍山海螺',
        y: 50,
        drilldown: 'maanshanghailuo'
    }, {
        name: '白马山',
        y: 30,
        drilldown: 'baimashang'
    }, {
        name: '全椒海螺',
        y: 25,
        drilldown: 'quanjiahailuo'
    }];
    drilldownorder=[{
        name: 'maanshanghailuo',
        id: 'maanshanghailuo',
        data: [
            [
                '皖1012070',
                20
            ],
            [
                '皖Q07772',
                 10
            ],
            [
                '皖E07570',
                20
            ]
        ]
    }, {
        name: 'baimashang',
        id: 'baimashang',
        data: [
             [
                '皖B52439',
                10
            ],
            [
                '皖0201138',
                5
            ],
            [
                '皖E37465',
                15
            ]
        ]
    }, {
        name: 'quanjiahailuo',
        id: 'quanjiahailuo',
        data: [
               [
                '皖M74276',
                5
            ],
            [
                '皖M96435',
                10
            ],
            [
                '皖M49748',
                10
            ]
        ]
    }];
    // Create the chart
    $('.order-2').highcharts({
        chart: {
            type: 'column'
        },
        credits: {
            enabled: false
        },
        exporting:{  
        	enabled:false 
        },  
        title: {
            text: null
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: '车辆本周订单数'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    format: '{point.y}'
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b>单<br/>'
        },
        series: [{
            name: '订单数',
            colorByPoint: true,
            data: orderdata
        }],
        drilldown: {
            series:drilldownorder
        }
    });
    
    /**
     * 厂商订单趋势统计
     */
    $('.order-3').highcharts({
    		    title: {
    		        text: null,
    		    },
    		    credits: {
    	            enabled: false
    	        },
    	        exporting:{  
    	        	enabled:false 
    	        },  
    		    xAxis: {
    		        categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
    		    },
    		    yAxis: {
    		        title: {
    		            text: '订单数'
    		        },
    		        plotLines: [{
    		            value: 0,
    		            width: 1,
    		            color: '#808080'
    		        }]
    		    },
    		    tooltip: {
    		        valueSuffix: '单'
    		    },
    		    legend: {
    		        layout: 'vertical',
    		        align: 'right',
    		        verticalAlign: 'middle',
    		        borderWidth: 0
    		    },
    		    series: [{
    		        name: '马鞍山海螺',
    		        data: [7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9]
    		    }, {
    		        name: '白马山',
    		        data: [2, 8, 7, 11, 17, 22, 24, 24, 20, 14, 6, 2]
    		    }, {
    		        name: '全椒海螺',
    		        data: [9, 6, 5, 8, 13, 17, 18, 17, 14, 9, 3, 1]
    		    }]
    
    });
    
    /**
     *  实时吨位统计
     */
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });
    function activeLastPointToolip(chart) {
        var points = chart.series[0].points;
        chart.tooltip.refresh(points[points.length -1]);
    }
    $('.order-4').highcharts({
        chart: {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function () {
                    // set up the updating of the chart each second
                    var series = this.series[0],
                        chart = this;
                    setInterval(function () {
                        var x = (new Date()).getTime(), // current time
                            y = Math.random()*100;
                        series.addPoint([x, y], true, true);
                        activeLastPointToolip(chart)
                    }, 1000);
                }
            }
        },
        credits: {
            enabled: false
        },
        title: {
            text: null
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150
        },
        yAxis: {
            title: {
                text: '吨位值'
            },
            plotLines: [{
                value: 10,
                width: 100,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        series: [{
            name: '吨位数据',
            data: (function () {
                // generate an array of random data
                var data = [],
                    time = (new Date()).getTime(),
                    i;
                for (i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: Math.random()
                    });
                }
                return data;
            }())
        }]
    }, function(c) {
        activeLastPointToolip(c)
    });
    
    /**
     * 厂商报警数量
     */
    $('.order-5').highcharts({
        chart: {
            type: 'bar'
        },
        exporting: {
            enabled: false
        },
        title: {
            text: null
        },
        xAxis: {
            categories: ['马鞍山海螺', '白马山', '全椒海螺', '宁国海螺'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '总量 (个)',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' 百万'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true,
                    allowOverlap: true
                }
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [{
            name: '告警统计',
            data: [107, 31, 635, 203]
        }]
    });
});
