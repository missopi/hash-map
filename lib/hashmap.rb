# frozen_string_literal: true

# class for node info
class Node
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

# class for hash map code
class HashMap
  attr_reader :buckets, :capacity

  LOAD_FACTOR = 0.75

  def initialize(capacity = 16)
    @buckets = Array.new(capacity) { [] }
    @capacity = capacity
    @length = 0
  end

  # produce hash
  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % capacity
  end

  # set hash
  def set(key, value)
    hash_index = hash(key)
    buckets[hash_index] = [{ key => value }]
    @length += 1

    raise IndexError if hash_index.negative? || hash_index >= buckets.length

    change_capacity if load_factor_reached?
  end

  # return key value
  def get(key)
    hash_index = hash(key)
    return 'String not found' if buckets[hash_index].nil?

    buckets[hash_index].each do |hash|
      return hash.values[0] if hash.include?(key)
    end
  end

  # is key in hash map?
  def key?(key) end

  # delete from hash map
  def remove(key) end

  # number of keys in hash map
  def length() end

  # buckets full?
  def load_factor_reached?
    true if @length > (capacity * LOAD_FACTOR)
  end

  # make array bigger
  def change_capacity
    new_capacity = capacity * 2
    @buckets = Array.new(new_capacity)
  end

  # empies hash map
  def clear() end

  # returns array of all keys in hash map
  def keys
    # @buckets
  end

  # return array of values
  def values
    # @buckets
  end

  # returns array of all key, value pairs
  def entries() end
end

h = HashMap.new
h.set('me', 'sophie')
h.set('house', 'chester')
h.set('island', 'isle of man')
h.set('surname', 'rose')
h.set('county', 'cheshire')
p h
puts h.get('me')
