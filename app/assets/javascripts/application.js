// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .


$(function() {
    $( "#conflict_result" )
        .ajaxStart(function() {
          $(this).hide();
        });

    $("#loading_animation").ajaxStart(function() {
       $(this).show("fade", 1000);
    });
});

$(function() {
    $( "#conflict_button" )
        .button();
});

$(function() {
    $( "#blood_pressure_date" )
        .datetimepicker({dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm', ampm: false});
});

$(function() {
    $( "#pulse_date" )
        .datetimepicker({dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm', ampm: false});
});

$(function() {
    $( "#weight_date" )
        .datetimepicker({dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm', ampm: false});
});

$(function() {
    $( "#tabs" ).tabs();
});

