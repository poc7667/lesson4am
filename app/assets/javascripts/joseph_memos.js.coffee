# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  image = document.getElementById("background")
  image.onload = ->
    engine = new RainyDay(image: this)
    engine.rain [[
      1
      2
      8000
    ]]
    engine.rain [
      [
        3
        3
        0.88
      ]
      [
        5
        5
        0.9
      ]
      [
        6
        2
        1
      ]
    ], 100
    return

  image.crossOrigin = "anonymous"
  image.src = "http://i.imgur.com/N7ETzFO.jpg"