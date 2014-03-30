class ScorecardDecorator < Draper::Decorator
  delegate_all
  decorates_association :round
  decorates_association :turns
  decorates_association :user

  def user_name
    user.first_name
  end

  def user_initials
    user.initials
  end

  def display_score
    "#{total} (#{shooting})"
  end

  def display_total
    "#{total}#{incomplete_symbol}"
  end

  def display_shooting
    "#{shooting}#{incomplete_symbol}"
  end

  def score_for_hole(number)
    turn_for_hole(number).score || "-"
  end

  def title
    round.title
  end

  def display_date
    round.display_date
  end

  def short_date
    round.short_date
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

  def incomplete_symbol
    "*" unless completed?
  end
end
