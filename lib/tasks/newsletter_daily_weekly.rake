namespace :newsletter_daily_weekly do
  desc "Send daily and weekly newsletter"
  task mailig: :environment do
    users = Account.where(digest: "daily")
    for user in users do
      NewsMailer.send_newsletter(News.all, user).deliver
    end
  end
end
