module ApplicationHelper

  def current_year 
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :id => key, :class => 'flash'
    end.join
  end

end
