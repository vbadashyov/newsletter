namespace :newsletter_daily do
  desc "Send daily newsletter"
  task mailig: :environment do
    users = Account.where(digest: "daily")
    for user in users do
      NewsMailer.send_newsletter(News.all, user).deliver
    end
  end
end
