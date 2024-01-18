# frozen_string_literal: true

# class for hash map code
class HashMap
  attr_reader :buckets, :capacity

  LOAD_FACTOR = 0.75

  def initialize
    @buckets = Array.new(16) { [] }
    @capacity = 0
  end

  # produce hash key
  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % buckets.length
  end

  # set hash
  def set(key, value)
    hash_index = hash(key)
    raise IndexError if hash_index.negative? || hash_index >= buckets.length

    if !buckets[hash_index].nil?
      buckets[hash_index].append({ key => value })
    else
      buckets[hash_index] = { key => value }
    end

    @capacity += 1
    change_capacity
  end

  # return key value
  def get(key)
    hash_index = hash(key)
    raise IndexError if hash_index.negative? || hash_index >= buckets.length
    return 'String not found' if buckets[hash_index].nil?

    buckets[hash_index].each do |hash|
      return hash.values[0] if hash.include?(key)
    end
  end

  # is key in hash map?
  def key?(key)
    return true if keys.include?(key)

    false
  end

  # delete from hash map
  def remove(key)
    hash_index = hash(key)
    buckets[hash_index].each { |hash| hash.delete(key) if hash.include?(key) }
    buckets.each { |bucket| bucket.delete({}) }
    @capacity -= 1
  end

  # amount of keys
  def length
    @capacity
  end

  # buckets full?
  def load_factor_reached?
    return true if length > (buckets.length * LOAD_FACTOR)

    false
  end

  # make array bigger
  def change_capacity
    current_entries = entries
    new_capacity = buckets.length * 2
    return unless load_factor_reached?

    @buckets = Array.new(new_capacity) { [] }
    @capacity = 0
    current_entries.each do |entry|
      entry_key = entry.keys.shift.strip
      entry_value = entry.values.shift.strip
      set(entry_key, entry_value)
    end
  end

  # empies hash map
  def clear
    @buckets = Array.new(16) { [] }
    @capacity = 0
  end

  # returns array of all keys in hash map
  def keys
    keys = []
    entries.each { |entry| keys << entry.keys }
    keys.flatten
  end

  # return array of values
  def values
    values = []
    entries.each { |entry| values << entry.values }
    values.flatten
  end

  # returns array of all key, value pairs
  def entries
    entries = []
    buckets.each { |bucket| entries << bucket unless bucket == [] }
    entries.flatten
  end
end
