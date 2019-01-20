namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app voter-preference-app --confirm voter-preference-app
      heroku run rake db:migrate --app voter-preference-app
      heroku run rake db:seed --app voter-preference-app')	
  end
end
