module ApplicationHelper
  def flash_message
    if flash.count > 0 then
      messages_list = []
      [:notice, :info, :warning, :error].each do |type|
        if flash[type] then
          flash[type].each do |field, messages| 
            messages.each { |message| messages_list << message }
          end
        end
      end

      messages_list
    end
  end

  def show_errors(messages)
    errors_html = '<ul>'
    messages.each { |msg| errors_html << "<li>#{msg}</li>" }
    errors_html << '</ul>'
    raw errors_html
  end

  def get_last_transactions
    transactions = Transaction.order("transaction_date DESC").limit(10)
    transactions.each { |transaction| yield transaction }
  end

  def final_balance
    Transaction.sum('value')
  end
end
