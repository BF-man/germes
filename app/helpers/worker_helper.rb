module WorkerHelper
  def input_or_div_for_task(condition, id, conent)
    result = condition ? tag("input", value: conent, id: id) : content_tag("div", conent)
  end

end
