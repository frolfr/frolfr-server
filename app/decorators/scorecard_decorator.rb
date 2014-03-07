class ScorecardDecorator < Draper::Decorator
  delegate_all

  def name
    user.name
  end

  def shooting
    return "(Even)" if at_par?
    return "(#{shooting_symbol}#{source.shooting})"
  end

  private

  def shooting_symbol
    "+" if over_par?
  end
end
