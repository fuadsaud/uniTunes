module AdminHelper
  def admin_destroy_media_link
    if admin?
      link_to 'Destroy', medium_path(@medium),
        method: :destroy,
        confirm: 'Are you sure?',
        class: 'btn btn-danger'
    end
  end
end
