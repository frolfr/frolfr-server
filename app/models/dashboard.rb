class Dashboard
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def decorate
    DashboardDecorator.new(self)
  end
end
