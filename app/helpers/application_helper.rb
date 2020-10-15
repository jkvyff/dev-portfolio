module ApplicationHelper
  def login_helper style = ''
    if !current_user.is_a?(GuestUser)
      (link_to "Profile", edit_user_registration_path, class: style) + " " +
      (link_to "Logout", destroy_user_session_path, method: :delete, class: style)
    else
      (link_to "Register", new_user_registration_path, class: style) + " " +
      (link_to "Login", new_user_session_path, class: style)
    end
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout.", class: "source-greeting")
    end
  end

  def set_copyright
    "&copy; #{Time.now.year} | <b>Jens Vyff</b> , All rights reserved".html_safe
  end
end

