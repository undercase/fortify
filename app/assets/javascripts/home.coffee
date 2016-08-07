# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###$(document).on 'turbolinks:load', ->
  $(window).scroll ->
    if $(window).scrollTop() > 5
      $('#main_menu').stop().animate({'background-color': 'rgba(80,172,111,1)'}, 500)
    else
      $('#main_menu').stop().animate({'background-color': 'rgba(80,172,111,0)'}, 500)###
