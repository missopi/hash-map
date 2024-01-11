# frozen_string_literal: true

# class for hash map code
class HashMap
  MAX_CAPACITY = 14
  LOAD_FACTOR = 0.75

  def initialize
    @buckets = Array.new(MAX_CAPACITY)
  end

  # produce hash
  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # create bucket value
  def bucket(key)
    hash_code = hash(key)
    hash_code % 16
  end

  # set hash
  def set(key, value)
    bucket_key = bucket(key)
    bucket_value = hash(value)

    @buckets.push({ bucket_key => bucket_value })

    @buckets.length = MAX_CAPACITY * 2 if @buckets.length / MAX_CAPACITY >= LOAD_FACTOR
  end

  # return key value
  def get(key)
    return key if key == hash(key)

    nil
  end

  # is key in hash map?
  def key?(key)
    true if @buckets.include?(key)
  end

  # delete from hash map
  def remove(key) end

  # number of keys in hash map
  def length() end

  # empies hash map
  def clear() end

  # returns array of all keys in hash map
  def keys() end

  # return array of values
  def values() end

  # returns array of all key, value pairs
  def entries() end
end

hash = HashMap.new
puts hash.hash('hello')
