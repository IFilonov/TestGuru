module ApplicationHelper
  ALERT_TYPES = {
    alert: "danger",
    notice: "info"
  }

  def time
     Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    flash.map do |type, message|
      class_type = "alert alert-#{ALERT_TYPES[type.to_sym]}"
      content_tag :div, message, class: class_type, role: 'alert'
    end.join("\n").html_safe
  end
end
