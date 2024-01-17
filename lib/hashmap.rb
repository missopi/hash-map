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
    new_capacity = buckets.length * 2
    return unless load_factor_reached?

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
  def entries
    entries = []
    buckets.each { |bucket| entries += bucket.to_a unless bucket.nil? }
    entries
  end
end

h = HashMap.new
p h.hash('buritto')
h.set('name', 'sophie')
h.set('city', 'chester')
h.set('county', 'cheshire')
h.set('surname', 'rose')
h.set('island', 'isle of man')
h.set('children', '2')
h.set('chair', 'black')
h.set('animal', 'zebra')
h.set('dog', 'rex')
h.set('cat', 'milo')
h.set('horse', 'neigh')
h.set('drum', 'blue')
h.set('keyboard', 'black and white')

p h
p h.get('island')
p h.get('horse')
p h.get('city')

p h.length
p h.entries
