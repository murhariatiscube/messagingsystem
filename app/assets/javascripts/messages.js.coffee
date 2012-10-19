# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
$("#rr").blur ->
  if $("#rr").val() is ""
    alert "please enter username"
    $("#rr").css "background-color", "#D6D6FF"

