# frozen_string_literal: true

# class for hash map code
class HashMap
  # produce hash
  def hash(string)
    hash_code = 0
    prime_number = 31

    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # set hash
  def set() end

  # return key value
  def get() end

  # is key in hash map?
  def key?() end

  # delete from hash map
  def remove() end

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
