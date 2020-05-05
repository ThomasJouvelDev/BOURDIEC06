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
      render :new
    end
  end

  def thanks
  end

  def new_produit
    @article = Article.find(params[:id])
    @contact = Contact.new
  end

  def create_produit
    @article = Article.find(params[:id])
    @contact = Contact.new(contact_produit_params)

    if @contact.save
      ContactMailer.produit_message(@contact, @article).deliver_now
      render :thanks_produit
    else
      render :new_produit
    end
  end

  def thanks_produit
  end

private

  def contact_params
    params.require(:contact).permit(:email, :message, :name, :tel)
  end

  def contact_produit_params
    params.require(:contact).permit(:email, :message, :name, :tel)
  end
end
