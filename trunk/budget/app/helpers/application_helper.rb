# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    @content_for_title = page_title.to_s
  end
end
