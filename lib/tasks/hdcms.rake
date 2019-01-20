namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app voter-preference-api --confirm voter-preference-api
      heroku run rake db:migrate --app voter-preference-api
      heroku run rake db:seed --app voter-preference-api')	
  end
end
