# wareware template application for rails4.1

## Rename application's name

```
git grep -l 'wareware'|xargs sed -i '' 's/wareware/your_app_name/g'
```

## Setup for development

rename Guardfile.example to Guardfile

```
$ cp Guardfile.example Guardfile
```

## External API Credential

```
cp config/application.yml.example config/application.yml
```

Fill in api credential

```
rake secret
```

Fill in SECRET_TOKEN by the key above result.

```
rake secret
```

Change devise's secret_token(config/initializers/devise.rb) by the key above result.

## Start guard

```
$ guard
```

## heroku

```
heroku create wareware
git remote rename heroku wareware
git push wareware master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
rake figaro:heroku\[wareware\]
```

### staging

```
heroku create wareware-stg
git remote set-url wareware-stg git@heroku.com:wareware-stg.git
git push wareware master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
heroku addons:add mailtrap
heroku config:set RACK_ENV=staging RAILS_ENV=staging
rake figaro:heroku\[wareware-stg\]
```
