inputScore = ->
  $dropdown = $("select[name='turn[score]'").last()
  $radios = $("input:radio[name='turn[par]']")
  id = $dropdown.data("id")
  url = "/turns/" + id

  $dropdown.on 'change', (event) ->
    $.ajax
      url: url
      type: "JSON"
      method: "put"
      data: {
        score: $dropdown.val() 
      }
      success: (data) ->
        $scorecards = $.parseJSON(data)
        $.each($scorecards, (index, value) ->
          $total = $("#total-" + value.scorecard_id + "-" + value.user_id  + " span.total")
          $total.text(value.score)
        )

  $radios.on 'click', (event) ->
    $.ajax
      url: url,
      method: "put",
      data: {
        par: $(this).val() 
      }
      success: (data) ->
        $scorecards = $.parseJSON(data)
        $.each($scorecards, (index, value) ->
          $total = $("#total-" + value.scorecard_id + "-" + value.user_id  + " span.total")
          $total.text(value.score)
        )

$(document).on 'pageinit', -> inputScore()
