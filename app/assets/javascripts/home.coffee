$ ->
  $.fn.api.settings.debug = false
  $.fn.api.settings.api =
  'sort': '/home/sort'
  'all games': '/home/all_games'
  
  $('#filter').click ->
    $('.card-holder').api('set loading')
    $.ajax '/home/sort',
    type: 'GET'
    dataType: 'script'
    data: {
      game_id: $('#game-filter').val()
      sorted_by: $('#time-filter .item.selected').data('time')
    }
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("Error: #{textStatus}")
      $('.card-holder').api('set error')
    success: () ->
      console.log "success!"
      $('.card-holder').api('remove loading')

  $('#clear-filter').api(
    action: 'all games'
    stateContext: '.card-holder'
    dataType: 'script'
    on: 'click'
    method: 'GET')
    .click ->
      $('#time-filter').dropdown('restore defaults')
      $('#game-filter').dropdown('restore defaults')

  $('#most-played').accordion selector: trigger: '.game-title'
  
  $('#filter').popup content: "Filter!"
  
  $('#clear-filter').popup content: "Clear it!"