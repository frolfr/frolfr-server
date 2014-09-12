inputScore = ->
  $adders = $('.js-add-to-score')
  $subtracters = $('.js-minus-from-score')
  $saver = $("#save-round")
  $pars = $('.js-pars')
  $scores = $('.js-hole-score')

  $adders.on 'click', (event) ->
    event.preventDefault()
    $score = $(this).closest('.js-scorecard-row').find('.js-hole-score')

    score = parseInt($score.text())
    score += 1
    if score >= 0 && score < 9
      $score.text(score)

    changeColors()

  $subtracters.on 'click', (event) ->
    event.preventDefault()
    $score = $(this).closest('.js-scorecard-row').find('.js-hole-score')

    score = parseInt($score.text())
    score -= 1
    if score >= 0 && score < 9
      $score.text(score)

    changeColors()

  $saver.on 'click', (event) ->
    event.preventDefault()
    $par = $('.js-par')

    par = $par.text()
    results = {}

    $.each($scores, (i, score) ->
      $score = $(score)
      results[$score.data('turn-id')] = $score.text()
    )

    $.ajax
      url: $saver.data('link'),
      method: "put",
      data: {
        par: par,
        results: results
      }
      success: (data) ->
        window.location.replace(data.url)

  $pars.on 'click', (event) ->
    event.preventDefault()
    $pars.removeClass('darkened js-par')
    $(this).addClass('darkened js-par')
    changeColors()

  changeColors = ->
    $scores.removeClass('over-par under-par')
    $.each($scores, (i, score) ->
      $score = $(score)
      score = parseInt($score.text())
      par = parseInt($('.js-par').text())

      if score > par
        $score.addClass('over-par')
      else if score < par
        $score.addClass('under-par')
    )


$(document).ready inputScore
$(document).on "page:load", inputScore
