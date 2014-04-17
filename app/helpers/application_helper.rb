module ApplicationHelper
  def human(model_class, attr_name)
    model_class.human_attribute_name(attr_name)
  end

  def boolean_icon(bool)
    return unless bool
    capture_haml do
      haml_tag('i.fa.fa-check')
    end
  end

  def google_map(address, options = {})
    options.reverse_merge! language: I18n.locale.to_s, region: 'jp'
    "https://www.google.com/maps/embed/v1/place?key=#{ENV['GOOGLE_MAP_API_KEY']}&q=#{CGI.escape(address)}&#{options.to_param}"
  end
end
