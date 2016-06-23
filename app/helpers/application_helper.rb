module ApplicationHelper
  def account_balance
   humanized_money_with_symbol current_user.wallet.balance
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info',
    }.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages
    capture do
      flash.each do |msg_type, message|
        concat(
          content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade in", role: 'alert') do
            concat(content_tag(:button, type: 'button', class: 'close', data: { dismiss: 'alert' }) do
              concat content_tag(:span, '&times;'.html_safe)
            end)

            concat message
          end
        )
      end
    end
  end

  def humanized_date date
    date.strftime('%d/%m/%Y %H:%M')
  end
end
