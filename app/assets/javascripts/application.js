// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require materialize-sprockets
//= require echarts.min
//= require_tree .

hide = function(elem) {
    if (elem.hasClass("hide")) {
        elem.removeClass("hide");
    } else {
        elem.addClass("hide");
    }
};

chart = function(element, label, data_label, data_values, type) {
    // based on prepared DOM, initialize echarts instance
    var myChart = echarts.init(element);
    console.log(data_label)
    console.log(data_values)
        // specify chart configuration item and data
    var option = {
        tooltip: {},
        legend: {
            data: [label]
        },
        xAxis: {
            data: data_label
        },
        yAxis: {
            axisLabel: { rotate: 0, fontSize: 12 }
        },
        grid: {
            left: 50
        },
        series: [{
            name: label,
            type: type,
            areaStyle: {},
            data: data_values
        }]
    };

    // use configuration item and data specified to show chart
    myChart.setOption(option);
};

chartPie = function(element, label, data_label, data_values) {
    var myChart = echarts.init(element);
    console.log(data_label)
    console.log(JSON.parse(data_values))

    var option = {
        // title: {
        //     text: 'Título',
        //     subtext: 'Subtítulo',
        //     x: 'center'
        // },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : R$ {c} ({d}%)"
        },
        legend: {
            type: 'scroll',
            orient: 'horizontal',
            right: 10,
            top: 20,
            bottom: 20,
            data: data_label
        },
        series: [{
            name: label,
            type: 'pie',
            radius: '55%',
            center: ['40%', '50%'],
            data: JSON.parse(data_values),
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };

    // use configuration item and data specified to show chart
    myChart.setOption(option);
};

//= require serviceworker-companion