class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    names.join(" ")
  end

  def initials
    names.map {|name| name.chars.first }.join
  end

  private

  def names
    [first_name, middle_name, last_name].compact
  end
end
