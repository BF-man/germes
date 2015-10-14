module UserHelper

  def input_or_div(user_signed, id, conent, current_u)

    attr={class: "task", value: conent, id: id}
    if user_signed && current_u.present?
      current_u.id.equal?(id) ? tag("input", attr) :  tag("input", attr.merge(disabled: "disabled"))
    else
       content_tag("div", conent)
    end
  end

end
