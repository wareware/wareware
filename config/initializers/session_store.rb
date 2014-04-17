# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: ENV['SESSION_KEY'] || "_genuineblue_session_#{Rails.env}", expire_after: 1.months
