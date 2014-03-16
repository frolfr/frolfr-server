class TurnDecorator < Draper::Decorator
  delegate_all
  decorates_association :round

  def hole_number
    I18n.t('hole.number', number: hole.number)
  end
end
