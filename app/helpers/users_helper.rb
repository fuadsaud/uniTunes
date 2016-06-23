module UsersHelper
  def link_to_toggle_user_lock(user)
    link_to toggle_user_lock_label(currently_locked: user.access_locked?),
      admin_user_path(user.id, user: { locked: !user.access_locked? }), method: :put
  end

  def toggle_user_lock_label(currently_locked:)
    currently_locked ? 'Unlock account' : 'Lock account'
  end
end
