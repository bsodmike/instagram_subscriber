# encoding: utf-8
module InstaSubscriber
  class SubscriptionsController < ApplicationController
    def callback
      mode = params["hub.mode"]
      challenge = params["hub.challenge"]
      verify_token = params["hub.verify_token"]

      if (mode.present? && mode == 'subscribe') && challenge.present?
        #realtime_subs = RealtimeSubscription.find_by_verify_token(verify_token)
        #if realtime_subs && !realtime_subs.nil?

        #end
        render :text => challenge
      else
        head 400, :content_type => 'text/html'
      end
    end

    def updates
      log_path = "#{Rails.root}/log/instagram_subscriber/"
      Dir.mkdir(log_path) unless File.directory?(log_path)
      logger = Logger.new(log_path + 'realtime_updates.log')
      logger.debug "#{params}"

      # NOTE acknowledge POSTed JSON payload
      head 200, :content_type => 'text/html'
    end
  end
end
