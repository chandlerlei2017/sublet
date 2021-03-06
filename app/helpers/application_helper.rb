module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-error"
        when 'alert' then "alert alert-error"
    end
  end

  def time_display(date)
    if date.today?
      date.strftime('%-I:%M %p')
    elsif date.to_date == Date.yesterday
      'Yesterday'
    elsif date.to_date > 1.week.ago.to_date
      date.strftime('%A')
    else
      date.strftime('%m, %d, %Y')
    end
  end

  def current_path
    current_uri = request.env['PATH_INFO']
  end

  def search_path
    case current_path
    when "/listings/all"
      all_listings_path
    when "/listings/my"
      my_listings_path
    when "/listings/saved"
      saved_listings_path
    when "/listings/applied"
      applied_listings_path
    else
      user_root_path
    end
  end
end
