namespace :newsletter_weekly do
  desc "Send weekly newsletter"
  task mailig: :environment do
    users = Account.where(digest: "weekly")
    for user in users do
      NewsMailer.send_newsletter(News.all, user).deliver
    end
  end
end
