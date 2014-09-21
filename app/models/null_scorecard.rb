class NullScorecard
  def welcome_message
    I18n.t('dashboard.welcome')
  end

  def decorate
    self
  end
end
