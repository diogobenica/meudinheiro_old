module ApplicationHelper
  def flash_message
    if flash.count > 0 then
      messages = []
      [:notice, :info, :warning, :error].each do |type|
        flash[type].each { |msg| messages << msg } if flash[type]
      end

      messages
    end
  end

  def show_errors(messages)
    errors_html = '<ul>'
    messages.each { |msg| errors_html << "<li>#{msg}</li>" }
    errors_html << '</ul>'
    raw errors_html
  end
end
