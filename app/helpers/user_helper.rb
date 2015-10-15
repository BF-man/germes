module UserHelper

  def input_or_div( id, conent)

    input_attibutes = { class: "task", value: conent, id: id }
    if user_signed_in? && current_user.present?
      current_user.id.equal?(id) ? tag("input", input_attibutes) :  tag("input", input_attibutes.merge(disabled: "disabled"))
    else
       content_tag("div", conent)
    end
  end

end
