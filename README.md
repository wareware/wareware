# GenuineBlue tempate application for rails4.1

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
heroku create GenuineBlue
git remote rename heroku GenuineBlue
git push GenuineBlue master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
rake figaro:heroku\[GenuineBlue\]
```

### staging

```
heroku create GenuineBlue-stg
git remote set-url GenuineBlue-stg git@heroku.com:GenuineBlue-stg.git
git push GenuineBlue master
heroku addons:add newrelic
heroku addons:add pgbackups:auto-month
heroku addons:add mandrill:starter
heroku addons:add mailtrap
heroku config:set RACK_ENV=staging RAILS_ENV=staging
rake figaro:heroku\[GenuineBlue-stg\]
```
