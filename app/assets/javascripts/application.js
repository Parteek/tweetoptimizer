// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function build_day_graph(days){
    $('#days-container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Followers Tweet Frequency'
        },
        subtitle: {
            text: 'Distributed over weekdays'
        },
        xAxis: {
            categories: [
                'Sunday',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Tweet Count'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tweets',
            data: days
        }]
    });
}

function build_time_graph(times){
    $('#times-container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Followers Tweet Frequency'
        },
        subtitle: {
            text: 'Distributed over hours in a day'
        },
        xAxis: {
            categories: [
                '0:00 - 1:00',
                '1:00 - 2:00',
                '2:00 - 3:00',
                '3:00 - 4:00',
                '4:00 - 5:00',
                '5:00 - 6:00',
                '6:00 - 7:00',
                '7:00 - 8:00',
                '8:00 - 9:00',
                '9:00 - 10:00',
                '10:00 - 11:00',
                '11:00 - 12:00',
                '12:00 - 13:00',
                '13:00 - 14:00',
                '14:00 - 15:00',
                '15:00 - 16:00',
                '16:00 - 17:00',
                '17:00 - 18:00',
                '18:00 - 19:00',
                '19:00 - 20:00',
                '20:00 - 21:00',
                '21:00 - 22:00',
                '22:00 - 23:00',
                '23:00 - 24:00',
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Tweet Count'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tweets',
            data: times
        }]
    });
}

