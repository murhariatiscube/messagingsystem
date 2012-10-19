# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  $("#name").click ->
    $(this).next("span").css("display", "inline").fadeOut 1500

  $("#data").click ->
    $(this).next("span").css("display", "inline").fadeOut 1500

  $("#form").click ->
    $(this).next("span").css("display", "inline").fadeOut 1500

  $("#Until").click ->
    $(this).next("span").css("display", "inline").fadeOut 1500
    
  

