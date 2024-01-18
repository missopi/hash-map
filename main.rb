# frozen_string_literal: true

require_relative 'lib/hashmap'

hashmap = HashMap.new
hashmap.set('hello', 'world')
hashmap.set('name', 'sophie')
hashmap.set('gorilla', 'george')
hashmap.set('dog', 'rex')
hashmap.set('cat', 'milo')
hashmap.set('kanga', 'roo')
hashmap.set('city', 'london')
hashmap.set('town', 'castle')
hashmap.set('monkey', 'fabio')
hashmap.set('donkey', 'derik')
hashmap.set('lime', 'green')
hashmap.set('orange', 'fruit')
hashmap.set('squash', 'peach')
hashmap.set('pine', 'apple')

p hashmap

p hashmap.get('orange')
p hashmap.key?('kanga')
hashmap.remove('name')

p hashmap.length
p hashmap.load_factor_reached?
p hashmap.keys
p hashmap.values

hashmap.clear
p hashmap
