# encoding: utf-8
require "instagram_subscriber/engine"

module InstaSubscriber
  autoload :Errors, 'instagram_subscriber/errors'
  autoload :Configuration, 'instagram_subscriber/configuration'

  class << self
    def configure
      raise Errors::MissingBlock unless block_given?
      @@config ||= InstaSubscriber::Configuration.new
      yield @@config if block_given?
    end
  end

  mattr_accessor :config
end
