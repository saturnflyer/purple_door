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
//= require foundation
//= require moment
//= require fullcalendar
//= require turbolinks
//= require moment
//= require fullcalendar
//= require foundation-datetimepicker
//= require_tree .

$(document).on('ready page:load', function () {
  $(function(){ $(document).foundation(); });

  $.get('/events.json', function(rawEvents) {

    var events = [];
    for (var i = 0; i < rawEvents.length; i++) {
      events.push({
        title: rawEvents[i].name,
        start: rawEvents[i].date,
        eventId: rawEvents[i].id
      });
    }

    $('#calendar').fullCalendar({
      header: {
        center: 'month,agendaWeek,agendaDay'
      },
      events: events,
      eventClick: function(calEvent) {
        var url = '/events/' + calEvent.eventId;
        window.location.href = url;
      }
    });
  });


  $('#event-date-picker').fdatetimepicker({
    minView: 2,
    format: 'yyyy-mm-dd', 
    disableDblClickSelection: true,
    autoclose: true,
  });
});
