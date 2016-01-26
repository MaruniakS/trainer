AppConfig = YAML.load_file(Rails.root.join('config', 'config.yml'))
env_options = AppConfig.delete(Rails.env)
AppConfig.merge!(env_options) unless env_options.nil?