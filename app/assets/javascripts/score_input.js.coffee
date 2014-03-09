inputScore = ->
  $dropdown = $("select[name='scorecard_hole[score]'").last()
  $radios = $("input:radio[name='scorecard_hole[par]']")
  id = $dropdown.data("id")
  url = "/scorecard_holes/" + id

  $dropdown.on 'change', (event) ->
    $.ajax
      url: url
      type: "JSON"
      method: "put"
      data: {
        score: $dropdown.val() 
      }
      success: (data) ->
        $scorecard = $.parseJSON(data)
        $total = $("#total-" + $scorecard.id+ " span.total")
        $total.text($scorecard.score)

  $radios.on 'click', (event) ->
    $.ajax
      url: url,
      method: "put",
      data: {
        par: $(this).val() 
      }
      success: (data) ->
        $scorecard = $.parseJSON(data)
        $total = $("#total-" + $scorecard.id+ " span.total")
        $total.text($scorecard.score)

$(document).on 'pageinit', -> inputScore()
