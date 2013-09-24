# encoding: utf-8
require 'spec_helper'

module InstaSubscriber
  describe Configuration do
    let(:config) { Configuration.new }

    describe "InstaSubscriber.configure without a block" do
      it "should raise Errors::MissingBlock" do
        expect{InstaSubscriber.configure()}.to raise_error(Errors::MissingBlock)
      end
    end

    describe "#add_setting" do
      describe "with no modifiers" do
        context "with no additional options" do
          before do
            config.add_setting :custom_option
          end

          it "defaults to nil" do
            expect(config.custom_option).to be_nil
          end

          it "adds a predicate" do
            expect(config.custom_option?).to be_false
          end

          it "can be overridden" do
            config.custom_option = "a value"
            expect(config.custom_option).to eq("a value")
          end
        end

        context "with :default => 'a value'" do
          before do
            config.add_setting :custom_option, :default => 'a value'
          end

          it "defaults to 'a value'" do
            expect(config.custom_option).to eq("a value")
          end

          it "returns true for the predicate" do
            expect(config.custom_option?).to be_true
          end

          it "can be overridden with a truthy value" do
            config.custom_option = "a new value"
            expect(config.custom_option).to eq("a new value")
          end

          it "can be overridden with nil" do
            config.custom_option = nil
            expect(config.custom_option).to eq(nil)
          end

          it "can be overridden with false" do
            config.custom_option = false
            expect(config.custom_option).to eq(false)
          end
        end
      end

    end
  end
end
