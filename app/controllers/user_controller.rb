class UserController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :users_to_show, :only => [:index]

  def index
  end

  def update
    @user_id = params[:id]
    @user = User.where(id: params[:id]).first

    if @user.present? && (current_user.id.equal?(@user.id) || current_user.director?)
      @error = t(:error_update_text) unless @user.update(user_params)
    else
      @error = t(:error_edit_denied)
    end
  end

  private
  def user_params
    params.require(:user).permit(:task)
  end

  private
  def users_to_show
    if current_user.present?
      @users = User.order("name = '#{current_user.name}' desc, name asc")
    else
      @users = User.order(:name)
    end
      @showbills = Showbill.order(:description)
  end
end
