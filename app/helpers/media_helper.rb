module MediaHelper
  def decorate_medium(medium, user)
    DecorateMedium.new.call(medium, user).call(self)
  end
end
