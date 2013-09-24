# encoding: utf-8

module InstaSubscriber

  # TODO document
  module Subscription
    extend self
    autoload :TagSubscription, 'instagram_subscriber/subscriptions/tag_subscription'

    def create(subscription)
      # TODO persist subscription we are about to create
      verify_token = "generate token"
      self.send(:"create_#{subscription.class.to_s.demodulize.underscore.downcase}", subscription, verify_token)
    end

    # @api private
    def create_tag_subscription(subscription, realtime_subs, verify_token)
      client_id = InstaSubscriber.config.client_id
      client_secret = InstaSubscriber.config.client_secret
      callback_url = InstaSubscriber.config.callback_url
      object = subscription.object
      aspect = subscription.aspect
      object_id = subscription.object_id
      req_params = "client_id=#{client_id}&"  \
            "client_secret=#{client_secret}&" \
            "callback_url=#{callback_url}&"   \
            "verify_token=#{verify_token}&"   \
            "object=#{object}&"               \
            "aspect=#{aspect}&"               \
            "object_id=#{object_id}"

      url = InstaSubscriber.config.subscriptions_api_url
      c = curl(url)
      c.http_post(req_params)
    end

    def curl(url)
      c = Curl::Easy.new(url) do |curl|
        curl.timeout = 120       # timeout in 2 minutes
      end
      c
    end

  end
end
