class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def general_message(contact)
    @contact = contact
    mail(to: "contact@bourdiec06.com", subject: "Vous avez un message de votre Site")
  end
end
