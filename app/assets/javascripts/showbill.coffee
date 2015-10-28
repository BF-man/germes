# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready", ->
  $('.showbill').on "keyup", ->
    $.ajax({method: "PATCH", url: "showbill/1", data: {showbill: {description: $(this).val()}, id: $(this).attr("id")}, dataType:"script"})