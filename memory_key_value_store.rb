class MemoryKeyValueStore
  def initialize
    @store = {}
  end
  
  def set(key, value)
    @store[key] = value
    "OK"
  end

  def get(key)
    return "Error: value is not a string" unless key.is_a? String
    @store[key]
  end

  def keys(pattern = nil)
    return @store.keys unless pattern
    regex = Regexp.new(pattern)
    @store.keys.select { |key| key.match(regex) }
  end
end
