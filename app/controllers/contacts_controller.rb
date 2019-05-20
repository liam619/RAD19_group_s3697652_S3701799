class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      UserMailer.contact_us(@contact).deliver
      flash[:success] = "Email sent!"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "invalid"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
