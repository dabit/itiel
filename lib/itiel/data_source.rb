module Itiel
  class DataSource
    def self.config_file_path
      @@config_file_path ||= 'config/sources'
    end

    def self.config_file_path=(value)
      @@config_file_path = value
    end

    def self.config_section
      @@config_file ||= self.name.underscore
    end

    def self.config_section=(value)
      @@config_file = value
    end

    def self.connection_settings
      file = "#{config_file_path}.yml"
      @@connection_settings ||= YAML.load_file(file)[config_section]
      raise "No connection settings found on #{file} for #{config_section}" unless @@connection_settings
      @@connection_settings
    end
  end
end
