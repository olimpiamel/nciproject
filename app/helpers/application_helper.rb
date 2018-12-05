module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Chambers"  # Variable assignment
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
