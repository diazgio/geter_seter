require 'rspec'
require_relative '../memory_key_value_store'
require 'byebug'

describe "MemoryKeyValueStore" do
  describe "#get" do
    context "with a matching key"do
      it "gets the value of key" do
      end
    end

    context "without a matching key" do
      it "returns the special value nil" do
      end

    end

    context "with a non-string value" do
      it "returns an error" do
      end
    end
  end

  describe "#set" do
    context "when they key does not hold a value" do
      it "sets the key to hold the string value" do
      end

      it "returns the string 'OK'" do
      end
    end

    context "when they key already holds a value" do
      it "sets the key to hold the string value" do
      end

      it "returns the string 'OK'" do
      end
    end
  end

  describe "#keys" do
    context "when no regex pattern is passed" do
      it "returns all keys" do
      end
    end

    context "when a regex pattern is passed" do
      it "returns all keys matching regex pattern" do
      end
    end
  end
end
