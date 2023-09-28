class UserMailer < ApplicationMailer
  default from: "info@drummer-tracker.com"

  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    @site_name = "DrummerTracker"
    @site_url = "https://drummer-tracker.com"
    mail(to: user.email, subject: 'パスワードリセット')
  end

  def activation_needed_email(user)
    return if user.guest?

    @user = user
    @url  = activate_user_url(@user.activation_token)
    @site_name = "DrummerTracker"
    @site_url = "https://drummer-tracker.com"
    mail(to: user.email, subject: 'DrummerTrackerアカウントの認証')
  end

  def activation_success_email(user)
   @user = user
   @url  = login_url
   mail(to: user.email, subject: 'DrummerTrackerアカウントが認証されました')
  end

  def send_email_change_activation(user, token, new_email)
    @user = user
    @token = token
    @new_email = new_email
    @url = activate_email_change_url(token: @token)
    mail(to: user.new_email, subject: "メールアドレス変更の確認")
  end
end

