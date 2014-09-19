class Dashboard
  attr_reader :user, :scorecards

  def initialize(user)
    @user = user
    @scorecards = user.scorecards
  end

  def decorate
    DashboardDecorator.new(self)
  end

  def pending_friendships
    I18n.t('friendship.no_pending')
  end

  def incomplete_scorecards
    scorecards.incomplete
  end

  def current_scorecard
    scorecards.by_date.first
  end
end
