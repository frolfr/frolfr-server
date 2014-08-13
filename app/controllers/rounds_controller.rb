class RoundsController < ApplicationController
  def index
    @scorecards = current_user.scorecards_by_date.decorate
  end

  def new
    @round_form = RoundForm.new
    @users = current_user.friends_by_name.decorate
    @approved_courses = Course.approved.by_name
  end

  def create
    @round_form = RoundForm.new(args: round_form_params)

    if @round_form.valid?
      @round = @round_form.save
      redirect_to turn_path(@round.scorecards.first.first_turn), notice: "Round created"
    else
      render :new, alert: "Please include a course."
    end
  end

  def show
    @round = Round.find(params[:id]).decorate
    @scorecards = @round.scorecards
  end

  private

  def round_form_params
    params
      .require(:round_form)
      .permit(:course_id, user_ids: [])
      .merge(current_user: current_user)
  end
end
