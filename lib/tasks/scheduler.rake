desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  Odd.update_odds
  puts "done."
end

desc "This task is called by the Heroku scheduler add-on"
task :update_accounts => :environment do
  puts "Updating accounts after games end..."
  Pick.update_win_or_lose
  puts "done."
end
