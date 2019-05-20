class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      UserMailer.contact_us(@contact).deliver_now
      flash[:success] = "Your inquiries/feedback have been sent to the site of admin. Thank you."
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "Failed to send message, please try again."
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
