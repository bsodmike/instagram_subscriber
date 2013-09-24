# encoding: utf-8
module InstaSubscriber
  class SubscriptionsController < ApplicationController
    def callback
      raise StandardError.new('heeeeelllloooo'), params.inspect
      challenge = params["hub.challenge"]
      verify_token = params["hub.verify_token"]

      realtime_subs = RealtimeSubscription.find_by_verify_token(verify_token)
      if realtime_subs && !realtime_subs.nil?

      else
        # TODO
      end
    end
  end
end
