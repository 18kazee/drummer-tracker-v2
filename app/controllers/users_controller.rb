class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create activate]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_needed_email
      redirect_to login_path, notice: t('defaults.message.activate_mail_send')
    else
      render :new, status: :unprocessable_entity
    end
  end

def activate
  if @user = User.load_from_activation_token(params[:id])
    @user.activate!
    redirect_to login_path, notice: t('defaults.message.activated') 
  else
    not_authenticated
  end
end
  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
