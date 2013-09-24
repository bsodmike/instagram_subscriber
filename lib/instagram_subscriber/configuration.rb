# encoding: utf-8

module InstaSubscriber

  # Stores runtime configuration information.
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

    # @macro [attach] add_setting
    #   @attribute $1
    #
    # @macro [attach] define_reader
    #   @attribute $1

    # @macro add_setting
    # The `client_id` for Instagram.
    add_setting :client_id

    # @macro add_setting
    # The `client_secret` for Instagram.
    add_setting :client_secret

    # @macro add_setting
    # The `callback_url` for Instagram's Real-time API.
    add_setting :callback_url

    # @macro define_reader
    # Returns Instagram's subscription API url.
    define_reader :subscriptions_api_url

    # @macro define_reader
    # Returns the callback route.
    define_reader :callback_route

    def add_setting(name, opts={})
      default = opts.delete(:default)
      (class << self; self; end).class_eval do
        add_setting(name)
      end
      send("#{name}=", default) if default
    end

    def initialize
      @subscriptions_api_url = 'https://api.instagram.com/v1/subscriptions/'
      @client_id = nil
      @client_secret = nil
      @callback_route = "instagram/subscriptions/callback"
      @callback_url = "http://your-callback.com/#{@callback_route}/"
    end

  end
end
