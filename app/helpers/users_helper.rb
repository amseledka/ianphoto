module UsersHelper
  def next_month_link(date = nil)
    date ||= Time.now
    desired_time = date + 1.month
    link_to(image_tag("arrow_next.png").html_safe, calendar_month_path(desired_time), :class => "switch_month_link next")
  end

  def previous_month_link(date = nil)
    date ||= Time.now
    desired_time = date - 1.month
    link_to(image_tag("arrow_back.png").html_safe, calendar_month_path(desired_time), :class => "switch_month_link prev")
  end
  
  def next_month_anchor_link(date = nil)
    date ||= Time.now
    desired_time = date + 1.month
    link_to(image_tag("arrow_next.png").html_safe, month_anchor(desired_time), :class => "switch_month_link next")
  end

  def previous_month_anchor_link(date = nil)
    date ||= Time.now
    desired_time = date - 1.month
    link_to(image_tag("arrow_back.png").html_safe, month_anchor(desired_time), :class => "switch_month_link prev")
  end
  
  def calendar_month_path(date)
    calendar_records_path(:month => date.to_date.beginning_of_month.to_s)
  end

  def month_anchor(date, options = nil)
    options ||= {}
    include_anchor = options.fetch(:include_anchor, true)
    [(include_anchor ? "#" : ""), "year_#{date.year}_month_#{date.month}"].join
  end

  def month_header(date = nil)
    date ||= Time.now
    "#{I18n.t("date.month_names")[date.month]} #{date.year}"
  end

  def full_year_calendar(&block)
    calendars = (-1..4).map do |month_number|
      desired_date = month_number.months.since
      content_tag(:li, :id => month_anchor(desired_date, :include_anchor => false)) {
        render("users/month_calendar", :desired_date => desired_date, :custom_day_content => block_given? ? block : nil).html_safe
      }.html_safe
    end
    calendars.join.html_safe
  end
  
  def month_calendar(month, &block)
    render("calendar_records/month_calendar", :desired_date => month, :custom_day_content => block_given? ? block : nil).html_safe
  end
end
