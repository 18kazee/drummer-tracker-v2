# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create activate]
  before_action :correct_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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

  def edit
    @user = current_user
  end

  def update
    if current_user.update(update_user_params)
      flash.now[:notice] = t('defaults.message.update', item: User.human_attribute_name(:profile))
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to user_path(current_user), notice: t('defaults.message.update', item: User.human_attribute_name(:profile)) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to login_path, notice: t('defaults.message.activated')
    else
      not_authenticated
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end

  def update_user_params
    params.require(:user)
          .permit(:name, :profile, :avatar, :avatar_cache)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: t('defaults.message.not_authorized') unless @user == current_user
  end
end
