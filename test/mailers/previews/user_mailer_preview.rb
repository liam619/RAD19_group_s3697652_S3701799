# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def contact_us
    con = Contact.new name: 'fak',
                      email: 'test',
                      message: 'dum'

    UserMailer.contact_us(con)
  end

end
