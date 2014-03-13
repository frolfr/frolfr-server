class RoundsController < ApplicationController
  def new
    @round_form = RoundForm.new
  end

  def create
    @round_form = RoundForm.new(args: round_form_params)

    if @round_form.valid?
      @round = @round_form.save
      redirect_to root_path, notice: "New Round Created!"
    else
      render :new
    end
  end

  private

  def round_form_params
    params.require(:round_form).permit(:course_id, user_ids: [])
  end
end
