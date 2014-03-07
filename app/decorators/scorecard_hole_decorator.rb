class ScorecardHoleDecorator < Draper::Decorator
  delegate_all

  def hole_number
    I18n.t('hole.number', hole.number)
  end
end
