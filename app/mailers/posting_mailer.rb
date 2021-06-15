class PostingMailer < ApplicationMailer
  def posting_mail(posting)
    @posting = posting
    mail to: "heromojung@gmail.com", subject: "投稿内容の確認メール"
  end
end
