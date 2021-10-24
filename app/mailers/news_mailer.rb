class NewsMailer < ActionMailer::Base

  default from: 'info@newsleter.localhost',
    template_path: 'mailers/news'

  def send_newsletter(news, acc)
    @news = news
    @acc = acc
    mail to: acc.email, 
         subject: 'Newsletter'
  end
end
