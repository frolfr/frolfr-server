class Dashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def decorate
    DashboardDecorator.new(self)
  end

  def pending_friendships
    I18n.t('friendship.no_pending')
  end

  def incomplete_scorecards
    user.scorecards.incomplete
  end
end
