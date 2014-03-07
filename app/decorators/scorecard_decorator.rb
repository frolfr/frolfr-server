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
    return "+" if over_par?
    return "-" if under_par?
  end
end
