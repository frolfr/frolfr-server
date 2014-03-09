inputScore = ->
  $dropdown = $("select[name='scorecard_hole[score]'").last()
  $radios = $("input:radio[name='scorecard_hole[par]']")
  url = "/scorecard_holes/" + $dropdown.data("id")

  $dropdown.on 'change', (event) ->
    $.ajax
      url: url,
      method: "put",
      data: {
        score: $dropdown.val() 
      }

  $radios.on 'click', (event) ->
    $.ajax
      url: url,
      method: "put",
      data: {
        par: $(this).val() 
      }

$(document).on 'pageinit', -> inputScore()
