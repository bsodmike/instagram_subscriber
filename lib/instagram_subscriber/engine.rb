module InstaSubscriber
  class Engine < ::Rails::Engine
    isolate_namespace InstaSubscriber

    config.after_initialize do
      Rails.application.routes.prepend do
        get "/instagram/subscriptions/callback" => "insta_subscriber/subscriptions#callback"
        post "/instagram/subscriptions/callback" => "insta_subscriber/subscriptions#updates"
      end
    end
  end
end
