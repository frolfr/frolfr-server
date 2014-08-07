class TurnDecorator < Draper::Decorator
  delegate_all
  decorates_association :round

  def hole_number
    hole.number
  end

  def turn_class
    if under_par?
      "under-par"
    elsif over_par?
      "over-par"
    end
  end
end
