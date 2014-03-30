class RoundsController < ApplicationController
  def new
    @round_form = RoundForm.new
    @users = User.by_name.decorate
    @courses = Course.by_name
  end

  def create
    @round_form = RoundForm.new(args: round_form_params)

    if @round_form.valid?
      @round = @round_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @round = Round.find(params[:id]).decorate
    @scorecards = @round.scorecards
  end

  private

  def round_form_params
    params.require(:round_form).permit(:course_id, user_ids: [])
  end
end
