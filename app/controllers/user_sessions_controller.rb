class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      cookies.encrypted[:user_id] = @user.id
      redirect_back_or_to root_path, notice: t('.success')
    else
      flash.now.alert = t('.failer')
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('.success')
  end

  def guest_login
    @guest_user = User.new(
      name: 'ゲスト',
      email: SecureRandom.alphanumeric(10) + '@example.com',
      password: 'password',
      password_confirmation: 'password',
      guest: true
    )
    
    return unless @guest_user.save

    cookies.encrypted[:user_id] = @guest_user.id
    auto_login(@guest_user)
    redirect_to root_path, notice: t('.success')
  
  end
end
