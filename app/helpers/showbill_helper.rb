require 'rails_autolink'

module ShowbillHelper
  def showbill_tag(id, content)
    if current_user.present? && current_user.director?
      text_area_tag("showbill", content,  {class: "showbill width-max-avail", id: id})
    else
      content_tag("div", auto_link(content))
    end
  end
end
