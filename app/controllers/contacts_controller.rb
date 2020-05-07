class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if verify_recaptcha(model: @contact) && @contact.save
      ContactMailer.general_message(@contact).deliver_now
      render :thanks
    else
      flash[:alert] = I18n.t 'errors.template.body'
      render :new
    end
  end

  def thanks
  end

private

  def contact_params
    params.require(:contact).permit(:email, :message, :name, :tel)
  end
end
