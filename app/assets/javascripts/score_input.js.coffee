inputScore = ->
  $adders = $('.js-add-to-score')
  $subtracters = $('.js-minus-from-score')

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

$(document).ready inputScore
$(document).on "page:load", inputScore
