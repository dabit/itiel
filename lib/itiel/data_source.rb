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
  end
end
