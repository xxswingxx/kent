# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	if $('#flipbook').length > 0
	  $('#flipbook').turn
	    width: 700,
	    height: 900;
	    display: 'single',
	    autoCenter: true