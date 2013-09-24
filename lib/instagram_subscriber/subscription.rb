# encoding: utf-8

module InstaSubscriber

  # TODO document
  module Subscription
    extend self
    autoload :TagSubscription, 'instagram_subscriber/subscriptions/tag_subscription'

    def create(subscription)
      client_id = InstaSubscriber.config.client_id
      client_secret = InstaSubscriber.config.client_secret
    end


  end
end
