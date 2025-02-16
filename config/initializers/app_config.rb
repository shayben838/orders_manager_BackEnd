class AppConfig
  raw_config = YAML.load_file(Rails.root.join('config/config.yml'))
  default_config = raw_config['default'] || {}
  env_config = raw_config[Rails.env] || {}

  CONFIG = default_config.merge(env_config)

  def self.[](key)
    CONFIG[key.to_s]
  end

  def self.get(key, default = nil)
    CONFIG.fetch(key.to_s, default)
  end
end