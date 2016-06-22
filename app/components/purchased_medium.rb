class PurchasedMedium < MediumDecorator
  def to_partial_path
    'media/purchased_medium'
  end

  def call_to_action
    h.link_to 'Download', download_url, class: 'btn btn-primary'
  end
end
