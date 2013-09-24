# encoding: utf-8
require "instagram_subscriber/engine"

module InstaSubscriber
  autoload :Errors, 'instagram_subscriber/errors'
  autoload :Configuration, 'instagram_subscriber/configuration'

  class << self
    # Yields the global configuration to a block.
    # @yield [Configuration] global configuration
    #
    # @example
    #     InstaSubscriber.configure do |config|
    #       config.client_id = "765410ba0..."
    #     end
    # @see Configuration
    # @raise [Errors::MissingBlock] if no block given
    def configure
      raise Errors::MissingBlock unless block_given?
      @@config ||= InstaSubscriber::Configuration.new
      yield @@config if block_given?
    end
  end

  mattr_accessor :config
end
