module BootstrapHelper
  def print_field(form, element, label, field, size = 'medium')
    label = form.label field, label, :class => "control-label"
    form_field = form.send(element, field, { :class=> "input-#{size}" })
    div_control = content_tag(:div, form_field, :class => "controls")
    content = label+div_control
    print_element(content)
  end

  def print_submit(form, text)
    submit_button = form.send(:submit, text, {:class => "btn btn-success"})
    content = content_tag(:div, submit_button, :class => "controls")
    print_element(content)
  end

  def print_element(content)
    content_tag(:div, content, :class => "control-group")
  end
end