module Itiel
  class Logger
    class << self
      attr_accessor :logger
    end

    def self.log_received(object, size)
      msg = "#{object_name(object)} received #{size}.rows"
      self.log_with_time(msg)
    end

    def self.log_processed(object, size)
      msg = "#{object_name(object)} processed #{size}.rows"
      self.log_with_time(msg)
    end

    def self.log_start_job(object)
      msg = "#{object_name(object)} run at #{Time.now}"
      self.enclosed_with_time(msg)
    end

    def self.log_end_job(object)
      msg = "#{object_name(object)} finished at #{Time.now}"
      self.enclosed_with_time(msg)
    end

    private
    def self.object_name(object)
      ( object.respond_to?(:name) ? object.name : object.class.name )
    end

    def self.info(message)
      self.logger.info(message)
    end

    def self.log_with_time(msg)
      self.info("#{Time.now} - #{msg}")
    end

    def self.enclosed_with_time(msg)
      self.info("\n==================================================\n")
      self.info(msg)
      self.info("\n==================================================\n")
    end
  end
end
