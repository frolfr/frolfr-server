class TurnsController < ApplicationController
  def show
    @turn = Turn.find(params[:id]).decorate
    @round = @turn.round
  end

  def update
    turn = Turn.find(params[:id])

    if update_params[:par]
      # turn.update_all_pars(update_params[:par])
    else
      turn.update(update_params)
    end

    scores = get_scores(turn.round.decorate)

    respond_to do |format|
      format.mobile { render json: scores }
    end
  end

  private

  def update_params
    params.permit(:score, :par)
  end

  def get_scores(round)
    round.scorecards.map do |scorecard|
      {
        score: scorecard.display_score,
        scorecard_id: scorecard.id,
        user_id: scorecard.user.id
      }
    end
  end
end
