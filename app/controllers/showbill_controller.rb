class ShowbillController < ApplicationController

  def update
    @showbill = Showbill.where(id: params[:id]).first

    if current_user.present?
      @error = t(:error_update_text) unless @showbill.update(user_params)
    else
      @error = t(:you_can_not_edit_it)
    end

  end

  private
  def user_params
    params.require(:showbill).permit(:description)
  end
end
