# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # # ..... your js
  #  $('.fancy .slot').jSlots({
  #       number : 2,
  #       winnerNumber : 1,
  #       spinner : '#playFancy',
  #       easing : 'easeOutSine',
  #       time : 7000,
  #       loops : 6,
  #       onStart : function() {
  #           $('.slot').removeClass('winner');
  #       },
  #       onWin : function(winCount, winners) {
  #           // only fires if you win
            
  #           $.each(winners, function() {
  #               this.addClass('winner');
  #           });

  #           // react to the # of winning slots                 
  #           if ( winCount === 1 ) {
  #               //alert('You got ' + winCount + ' 7!!!');
  #           } else if ( winCount > 1 ) {
  #               //alert('You got ' + winCount + ' 7’s!!!');
  #           }
            
  #       }
  #   });

$(document).ready(ready)
$(document).on('page:load', ready)
