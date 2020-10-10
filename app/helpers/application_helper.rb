module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to "logout", destroy_user_session_path, method: :delete
    else
      (link_to "login", new_user_session_path) + " " +
      (link_to "register", new_user_registration_path)
    end
  end
end
