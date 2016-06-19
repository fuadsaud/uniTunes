module ApplicationHelper
  def account_balance
   humanized_money_with_symbol current_user.wallet.balance
  end
end
