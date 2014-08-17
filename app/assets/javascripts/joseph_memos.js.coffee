# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  move_canvas_to_bg =->
    document.getElementById("background").remove();
    titles = document.getElementsByTagName("h1");
    canvas = document.getElementsByTagName("canvas");
    $.each canvas, (index, item) ->
      item.style.zIndex = -100
      return 
    $.each titles, (index, item) ->
      item.style.zIndex = 100
      return

  run = ->
    engine = new RainyDay("canvas", "background", window.innerWidth, window.innerHeight)
    engine.gravity = engine.GRAVITY_NON_LINEAR
    engine.trail = engine.TRAIL_DROPS
    engine.VARIABLE_GRAVITY_ANGLE = Math.PI / 8
    engine.rain [
      engine.preset(0, 2, 0.5)
      engine.preset(4, 4, 1)
    ], 50    
    return  
  run()
  move_canvas_to_bg()
  