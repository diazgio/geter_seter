require 'rspec'
require_relative '../memory_key_value_store'
require 'byebug'

describe "MemoryKeyValueStore" do
  describe "#get" do
    context "with a matching key"do
      it "gets the value of key" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        expect(store.get("zapato")).to eq("De cuero")
      end
    end

    context "without a matching key" do
      it "returns the special value nil" do
        store = MemoryKeyValueStore.new
        store.set("tv", "Smart tv")
        expect(store.get("zapato")).to be_nil
      end
    end

    context "with a non-string value" do
      it "returns an error" do
        store = MemoryKeyValueStore.new
        store.set("zapato", 'De cuero')
        expect(store.get(5)).to eq("Error: value is not a string")
      end
    end
  end

  describe "#set" do
    context "when they key does not hold a value" do
      it "sets the key to hold the string value" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        expect(store.get("zapato")).to eq("De cuero")
      end

      it "returns the string 'OK'" do
        store = MemoryKeyValueStore.new
        expect(store.set("zapato", "De cuero")).to eq("OK")
      end
    end

    context "when they key already holds a value" do
      it "sets the key to hold the string value" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        store.set("zapato", "De gamuza")
        expect(store.get("zapato")).to eq("De gamuza")
      end

      it "returns the string 'OK'" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        expect(store.set("zapato", "De gamuza")).to eq("OK")
      end
    end
  end

  describe "#keys" do
    context "when no regex pattern is passed" do
      it "returns all keys" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        store.set("tv", "Smart tv")
        store.set("laptop", "Macbook")
        expect(store.keys).to eq(["zapato", "tv", "laptop"])
      end
    end

    context "when a regex pattern is passed" do
      it "returns all keys matching regex pattern" do
        store = MemoryKeyValueStore.new
        store.set("zapato", "De cuero")
        store.set("tv", "Smart tv")
        store.set("laptop", "Macbook")
        expect(store.keys(/z/)).to eq(["zapato"])
      end
    end
  end
end
