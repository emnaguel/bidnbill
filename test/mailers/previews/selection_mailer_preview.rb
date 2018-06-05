# Preview all emails at http://localhost:3000/rails/mailers/selection_mailer
class SelectionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/selection_mailer/invitation_to_pay
  def invitation_to_pay
    SelectionMailer.invitation_to_pay
  end

end
