class MediumForPurchase < MediumDecorator
  def call_to_action
    h.link_to 'Buy',
      h.purchases_path(purchase: { medium_id: medium.id }),
      method: :post, class: 'btn btn-success'
  end


  def to_partial_path
    'media/medium_for_purchase'
  end
end
