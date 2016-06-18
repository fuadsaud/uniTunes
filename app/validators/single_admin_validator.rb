class SingleAdminValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << 'an admin already exists' if admin_exists?
  end

  private

  def admin_exists?
    User.exists?(admin: true)
  end
end
