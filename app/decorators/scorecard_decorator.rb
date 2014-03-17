class ScorecardDecorator < Draper::Decorator
  delegate_all
  decorates_association :round

  def user_name
    user.name
  end

  def display_score
    "#{total} #{shooting}"
  end

  def title
    round.title
  end

  private

  def shooting
    return "(Even)" if at_par?
    return "(#{shooting_symbol}#{source.shooting})"
  end

  def shooting_symbol
    "+" if over_par?
  end
end
