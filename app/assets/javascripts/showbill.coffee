# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready", ->
  $('.showbill').on "keyup", ->
    $.ajax({method: "PATCH", url: "showbill/" + $(this).attr("id"), data: make_data($(this)) , dataType:"script"})

  # converts div.html to textarea.text
  $('.showbill-div').on "click", ->
    if $('textarea').is('.showbill')
      text = $('.showbill-div').html().replace( /<br>/g,"\n")
      $('.showbill').text(disable_links(clean_text(text)))
      $('.showbill').show().focus()
      $('.showbill-div').hide()

  $('.showbill').on "blur", ->
    $('.showbill').hide()
    $('.showbill-div').show()

make_data = (item) ->
  return {} =
  showbill:{
    #we'll need description in one line. Replacing \n by <br> to don't lose them.
    description: item.val().replace(/\n/g, "<br />")}
  id: $(item).attr("id")

#extracts link_text from link_tag by deleting <a...> and </a>
disable_links = (text) ->
  text.replace(/<a.*?">/g, "").replace(/<\/a>/g,"")

clean_text = (text) ->
  text.replace(/^\n*\s*\n*\s*/,"").replace(/\s*$/,"")

