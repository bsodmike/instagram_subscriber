# encoding: utf-8

module InstaSubscriber::Subscription
  class TagSubscription
    def initialize(object, aspect, object_id)
      @object = nil
      @aspect = nil
      @object_id = nil
    end

    attr_reader :object, :aspect, :object_id
  end
end
