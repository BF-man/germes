module UserHelper

  def choose_tag( id, content)
    some_attributes = { class: "task width-max-avail", id: id }
    if user_signed_in? && current_user.present? && (current_user.id.equal?(id) || current_user.director?)
      text_area_tag("task", content, some_attributes)
    else
      content_tag("div", content)
    end
  end

end
