class ScorecardDecorator < Draper::Decorator
  delegate_all
  decorates_association :round

  def user_name
    user.name
  end

  def display_score
    "#{total} (#{shooting})"
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

  private

  def shooting_symbol
    "+" if over_par?
  end
end
