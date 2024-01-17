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
      @capacity += 1
    else
      buckets[hash_index] = value
    end

    change_capacity
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
  def key?(key)
    return true if keys.include?(key)

    false
  end

  # delete from hash map
  def remove(key) end

  # amount of keys
  def length
    @capacity
  end

  # amount of buckets with keys in them
  def amount_of_buckets
    amount = 0
    buckets.each { |bucket| amount += 1 unless bucket == [] }
    amount
  end

  # buckets full?
  def load_factor_reached?
    true if length > (buckets.length * LOAD_FACTOR)
  end

  # make array bigger
  def change_capacity
    current_entries = entries
    new_capacity = buckets.length * 2
    return unless load_factor_reached?

    @buckets = Array.new(new_capacity)
    current_entries.each do |entry|
      entry_key = entry.keys.shift.strip
      entry_value = entry.values.shift.strip
      set(entry_key, entry_value)
    end
  end

  # empies hash map
  def clear
    buckets.each(&:clear)
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

h = HashMap.new

h.set('name', 'sophie')
h.set('city', 'chester')
h.set('county', 'cheshire')
h.set('surname', 'rose')
h.set('island', 'isle of man')
h.set('children', '2')
h.set('chair', 'black')
h.set('animal', 'zebra')
h.set('dog', 'rex')

puts 'hashmap---------'
p h

puts 'get method-----------'
p h.get('island')
p h.get('name')
p h.get('city')

puts 'length----------'
p h.length

puts 'entries-----------'
p h.entries

puts 'keys------------'
p h.keys

puts 'values-------------'
p h.values

puts 'key?'
p h.key?('name')
p h.key?('jumper')

puts 'clear array------------'
h.clear
p h
