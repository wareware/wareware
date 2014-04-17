module LocaleSelectable
  extend ActiveSupport::Concern

  included do
    before_action :set_locale_from_params
  end

  private
  def set_locale_from_params
    I18n.locale = params[:locale].presence || session[:locale].presence || :en
    session[:locale] = I18n.locale
  end
end
