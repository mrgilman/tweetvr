module ApplicationHelper
  def username
    "@#{current_user.username}"
  end
end
