# encoding: utf-8

module InstaSubscriber
  module Errors
    # A general CurrencyParser exception.
    class Error < StandardError
      def initialize(msg = "Boom Shakalaka!! You've triggered a #{self}")
        super
      end
    end

    # Exception for missing blocks
    class MissingBlock < Error; end
  end
end
