class PostingMailer < ApplicationMailer
  def confirmation_mail(confirmation)
    @confirmation = confirmation
    mail to: "heromojung@gmail.com", subject: "投稿内容の確認メール"    
  end
end
