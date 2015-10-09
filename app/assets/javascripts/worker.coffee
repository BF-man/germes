# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready", ->
    $('input').on "blur", ->
      $.ajax({method: "PATCH", url: "worker/"+$(this).attr("id"), data: make_data($(this)), dataType:"script"})


make_data = (item) ->
  return {} =
         worker:{
           task: item.val()}
         id: $(item).attr("id")


