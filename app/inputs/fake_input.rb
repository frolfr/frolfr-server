class FakeInput < SimpleForm::Inputs::StringInput
  def input
    template.text_field_tag(attribute_name, nil, input_html_options)
  end
end
