fire = ->
  $('.collapse').on 'hidden.bs.collapse', (e) ->
    indicator = $(e.target).parent().find('.indicator')
    indicator.removeClass('glyphicon-chevron-down')
    indicator.addClass('glyphicon-chevron-up')

  $('.collapse').on 'show.bs.collapse', (e) ->
    indicator = $(e.target).parent().find('.indicator')
    indicator.removeClass('glyphicon-chevron-up')
    indicator.addClass('glyphicon-chevron-down')
$ ->
  fire

$(document).on 'page:change', fire
