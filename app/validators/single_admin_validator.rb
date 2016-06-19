class SingleAdminValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && admin_exists? && current_admin.id != record.id
      record.errors[attribute] << 'an admin already exists' if value && admin_exists?
    end
  end

  private

  def admin_exists?
    current_admin.present?
  end

  def current_admin
    User.admin
  end
end
