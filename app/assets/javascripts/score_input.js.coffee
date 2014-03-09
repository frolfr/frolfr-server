inputScore = ->
  $dropdown = $("#scorecard_hole_score")
  $radios = $("input:radio[name='scorecard_hole[par]']")

  $dropdown.on 'change', (event) ->
    round_id = $dropdown.data("roundId")
    id = $dropdown.data("scorecardHoleId")
    url = "/rounds/" + round_id + "/scorecard_holes/" + id
    
    $.ajax
      url: url,
      method: "put",
      data: {
        score: $dropdown.val() 
      }

  $radios.on 'click', (event) ->
    round_id = $dropdown.data("roundId")
    id = $dropdown.data("scorecardHoleId")
    url = "/rounds/" + round_id + "/scorecard_holes/" + id
    
    $.ajax
      url: url,
      method: "put",
      data: {
        par: $(this).val() 
      }

$(document).on 'pageinit', -> inputScore()
