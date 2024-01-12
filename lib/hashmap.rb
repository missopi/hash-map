# frozen_string_literal: true

# class for hash map code
class HashMap
  attr_reader :buckets

  CAPACITY = 16
  LOAD_FACTOR = 0.75

  def initialize
    @buckets = Array.new(CAPACITY)
  end

  # produce hash
  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % 16
  end

  # set hash
  def set(key, _value)
    hash_index = hash(key)

    if !buckets[hash_index].nil?
      buckets[hash_index].append(key)
    else
      buckets[hash_index] = [key]
    end

    raise IndexError if hash_index.negative? || hash_index >= buckets.length
  end

  # return key value
  def get(key)
    hash_index = hash(key)
    return 'String not found' if buckets[hash_index].nil?

    hash_index if buckets[hash_index].include?(key)
  end

  # is key in hash map?
  def key?(key) end

  # delete from hash map
  def remove(key) end

  # number of keys in hash map
  def length
    buckets.length
  end

  # buckets full?
  def load_factor_reached?() end

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
