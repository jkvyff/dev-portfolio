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

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: projects_path,
        title: "Projects"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: about_path,
        title: "About"
      },
    ]
  end

  def nav_helper style, tag_type, tags = true
    nav_links = ''
    if tags == false
      nav_items.each do |item|
        nav_links << "<a href='#{item[:url]}' class='#{style} #{active? item[:url]}' >#{item[:title]}</a>"
      end
    else
      nav_items.each do |item|
        nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}' >#{item[:title]}</a></#{tag_type}>"
      end
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert 
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Portfolio Alert", sticky: false)
  end
end
