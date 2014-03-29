class ScorecardDecorator < Draper::Decorator
  delegate_all
  decorates_association :round
  decorates_association :turns

  def user_name
    user.first_name
  end

  def display_score
    "#{total} (#{shooting})"
  end

  def score_for_hole(number)
    turn_for_hole(number).score || "-"
  end

  def title
    round.title
  end

  def display_date
    round.created_at.strftime("%A, %b %d")
  end

  def shooting
    return I18n.t('turn.even') if at_par?
    return "#{shooting_symbol}#{object.shooting}"
  end

  def class_for_turn(number)
    turn_for_hole(number).decorate.turn_class
  end

  private

  def shooting_symbol
    "+" if over_par?
  end
end
