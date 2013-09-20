# encoding: utf-8
require 'spec_helper'

describe Timezoner do
  it "should be a Module" do
    expect(Timezoner.is_a?(Module)).to be
  end

  it "should ..." do
    expect(Time.zone).to eq(ActiveSupport::TimeZone.new('UTC'))
    binding.pry
  end
end
