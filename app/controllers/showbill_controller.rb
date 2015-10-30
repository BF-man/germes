class ShowbillController < ApplicationController

  def update

    if current_user.present?
      @error = t(:error_update_text) unless @showbill = Showbill_singleton.instance.update(params[:description])
    else
      @error = t(:you_can_not_edit_it)
    end

  end

end
