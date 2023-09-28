class ContactsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to root_path, notice: "お問合せを受付ました。"
    else
      flash.now.alert = "お問合せに失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
