# encoding: utf-8

module InstaSubscriber
  class Configuration

    # @private
    def self.add_setting(name)
      attr_accessor name
    end

    add_setting :client_id

    def add_setting(name, opts={})
      default = opts.delete(:default)
      (class << self; self; end).class_eval do
        add_setting(name)
      end
      send("#{name}=", default) if default
    end

    def initialize
      @client_id = nil
    end

  end
end
