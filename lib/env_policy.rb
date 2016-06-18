class EnvPolicy
  def initialize(default: 'false')
    @default = default
  end

  def allow?(feature_name)
    to_bool(env_for(feature_name))
  end

  private

  attr_reader :default

  def to_bool(string)
    string.to_s == 'true'
  end

  def env_for(service_name)
    ENV.fetch("#{service_name.upcase}_ENABLED", default)
  end
end
