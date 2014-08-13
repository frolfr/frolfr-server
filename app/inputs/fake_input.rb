class FakeInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    template.text_field_tag(attribute_name, nil, wrapper_options)
  end
end
