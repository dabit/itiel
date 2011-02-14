module Itiel
  class Source
    def self.config_file_path
      @@config_file_path ||= 'config'
    end

    def self.config_file_path=(value)
      @@config_file_path = value
    end
  end
end
