# encoding: utf-8

module InstaSubscriber::Subscription
  class TagSubscription
    def initialize(object, aspect, object_id)
      @object = object
      @aspect = aspect
      @object_id = object_id
    end

    attr_reader :object, :aspect, :object_id
  end
end
