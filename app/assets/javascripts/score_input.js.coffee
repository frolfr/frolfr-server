inputScore = ->
  $adders = $('.js-add-to-score')
  $subtracters = $('.js-minus-from-score')
  $saver = $("#save-round")

  $adders.on 'click', (event) ->
    event.preventDefault()
    $score = $(this).closest('.js-scorecard-row').find('.js-hole-score')

    score = parseInt($score.text())
    score += 1
    if score >= 0 && score < 9
      $score.text(score)

  $subtracters.on 'click', (event) ->
    event.preventDefault()
    $score = $(this).closest('.js-scorecard-row').find('.js-hole-score')

    score = parseInt($score.text())
    score -= 1
    if score >= 0 && score < 9
      $score.text(score)

  $saver.on 'click', (event) ->
    $scores = $('.js-hole-score')
    results = {}
    $.each($scores, (i, score) ->
      $score = $(score)
      results[$score.data('turn-id')] = $score.text()
    )
    $.ajax
      url: $saver.data('link'),
      method: "put",
      data: {
        par: 3,
        results: results
      }
      success: (data) ->
        window.location.replace(data.url)

$(document).ready inputScore
$(document).on "page:load", inputScore
