class ScorecardDecorator < Draper::Decorator
  delegate_all

  def user_name
    user.name
  end

  def display_score
    "#{total} #{shooting}"
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
