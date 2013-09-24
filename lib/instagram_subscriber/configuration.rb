# encoding: utf-8

module InstaSubscriber
  class Configuration

    # @private
    def self.define_reader(name)
      define_method(name) do
        variable = instance_variable_defined?("@#{name}") ? instance_variable_get("@#{name}") : nil
        variable
      end
    end

    # @private
    def self.define_predicate_for(*names)
      names.each {|name| alias_method "#{name}?", name}
    end

    # @private
    #
    # Invoked by the `add_setting` instance method. Use that method on a
    # `Configuration` instance rather than this class method.
    def self.add_setting(name)
      attr_writer name
      define_reader name
      define_predicate_for name
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
