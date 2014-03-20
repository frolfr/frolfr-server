class TurnDecorator < Draper::Decorator
  delegate_all
  decorates_association :round

  def hole_number
    I18n.t('hole.number', number: hole.number)
  end

  def turn_class
    if under_par?
      "green"
    elsif over_par?
      "red"
    else
      "black"
    end
  end
end
