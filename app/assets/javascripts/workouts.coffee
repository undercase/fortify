# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.start.button').click ->
    $(this).text('Started')
    $(this).addClass('disabled')
  $('.workout .box').hover(->
    $(this).stop().animate({
      'background-color': '#50ac6f',
      'color': '#ffffff'
    }, 200)
  , ->
    $(this).stop().animate({
      'background-color': '#ffffff',
      'color': '#50ac6f'
    }, 200)
  )
  $('.actions.button').click ->
    $('.one.exercise.column').toggle()
    $('.one.rest.column').toggle()
    $('.delete.column').toggle()
    $('.actions.button i').toggle()

  $('.remove.icon').click ->
    $(this).closest('.exercise.display').fadeOut()

