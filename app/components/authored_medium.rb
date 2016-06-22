class AuthoredMedium < MediumDecorator
  def to_partial_path
    'media/authored_medium'
  end

  def call_to_action
    h.capture do
      h.concat h.link_to 'Edit', h.edit_medium_path(medium), class: 'btn btn-info'
      h.concat ' '
      h.concat(
        h.link_to 'Destroy', h.medium_path(medium),
          method: :destroy,
          confirm: 'Are you sure?',
          class: 'btn btn-danger'
      )
    end
  end
end
