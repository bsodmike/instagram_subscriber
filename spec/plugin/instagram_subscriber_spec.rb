# encoding: utf-8
require 'spec_helper'

describe InstaSubscriber do
  it "should be a Module" do
    expect(InstaSubscriber.is_a?(Module)).to be
  end

  it "should ..." do
    expect(Time.zone).to eq(ActiveSupport::TimeZone.new('UTC'))
    binding.pry
  end
end
