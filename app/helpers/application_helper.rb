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
end
