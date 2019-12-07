$(document).on 'turbolinks:load', ->
  $('#calendar').fullCalendar {}
  return

$(document).on 'turbolinks:before-cache', ->
  $('#calendar').empty()
  return