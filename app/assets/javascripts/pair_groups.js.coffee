# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  # display form submit data
  redirect_to_index = ->
    $.ajax
      type: 'GET'
      url:  '/pair_groups/redirect_to_index'       
    return

  $("#create_group_form").submit (event) ->
    event.preventDefault()
    group_list = {"male":[],"female":[], "groupName":'nil', "groupDescription": 'nil','action': 'add_group'}

    $(this).find("input").each ->
      genderRegexp = /(^\w+)/g;
      m = genderRegexp.exec(this.name);
      try
        if m[1] == "male"
          group_list.male.push this.value if this.value.length > 0
        else if m[1] == "female"
          group_list.female.push this.value if this.value.length > 0
        else if m[1] == "groupName"
          group_list.groupName = this.value
        else if m[1] == "groupDescription"
          group_list.groupDescription = this.value          
        else 
          alert m[1]
      catch error 
        console.log error
      return

    if group_list.male.length > 0 or group_list.female.length > 0
      $.ajax
        type: 'POST'
        url: '/pair_groups/add_group_list/'
        data: group_list
        dataType: 'json'
        success: (res) ->
          console.log 'ok'
        complete: ->
          setTimeout redirect_to_index, 500
    return
