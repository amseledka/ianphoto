module UsersHelper
  def next_month_link(date = nil)
    date ||= Time.now
    desired_time = date + 1.month
    link_to(image_tag("arrow_next.png").html_safe, month_anchor(desired_time), :class => "switch_month_link next")
  end

  def previous_month_link(date = nil)
    date ||= Time.now
    desired_time = date - 1.month
    link_to(image_tag("arrow_back.png").html_safe, month_anchor(desired_time), :class => "switch_month_link prev")
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
end
