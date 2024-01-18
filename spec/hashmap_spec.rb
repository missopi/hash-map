# frozen_string_literal: true

require_relative '../lib/hashmap'

describe HashMap do
  subject(:test_hashmap) { described_class.new }

  describe '#initialize' do
    context 'new_array' do
      it 'will be empty nested array' do
        cells = test_hashmap.buckets
        expect(cells).to eq([[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []])
      end
    end

    context 'new array' do
      it 'will have 16 cells' do
        cells = test_hashmap.buckets.size
        expect(cells).to eq(16)
      end
    end
  end

  describe '#hash' do
    context 'when a string is inputted' do
      it 'creates a hash code' do
        string = 'name'
        hash = test_hashmap.hash(string)
        expect(hash).to eq(11)
      end
    end
  end

  describe '#set' do
    context 'when bucket is empty' do
      it 'puts value in the bucket' do
        key = 'name'
        value = 'sophie'
        test_hashmap.set(key, value)
        buckets = test_hashmap.buckets
        expect(buckets).to eq([[], [], [], [], [], [], [], [], [], [], [], [{ 'name' => 'sophie' }], [], [], [], []])
      end
    end

    context 'when bucket already has a value' do
      before do
        test_hashmap.set('city', 'chester')
      end

      it 'adds new value to bucket too' do
        key = 'name'
        value = 'sophie'
        test_hashmap.set(key, value)
        buckets = test_hashmap.buckets
        expect(buckets).to eq([[], [], [], [], [], [], [], [], [], [], [],
                               [{ 'city' => 'chester' }, { 'name' => 'sophie' }], [], [], [], []])
      end
    end
  end

  describe '#get' do
    context 'when a key is inputted' do
      before do
        test_hashmap.set('name', 'sophie')
      end

      it 'returns the value' do
        key = 'name'
        value = test_hashmap.get(key)
        expect(value).to eq('sophie')
      end
    end
  end

  describe '#key?' do
    context 'when key is detected in hash map' do
      before do
        test_hashmap.set('name', 'sophie')
      end

      it 'returns true' do
        key = test_hashmap.key?('name')
        expect(key).to be true
      end
    end
  end

  describe '#remove' do
    context 'when key removed' do
      before do
        test_hashmap.set('name', 'sophie')
      end

      it 'empies bucket when is only element' do
        test_hashmap.remove('name')
        buckets = test_hashmap.buckets
        expect(buckets).to eq([[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []])
      end
    end

    context 'when key removed' do
      before do
        test_hashmap.set('name', 'sophie')
        test_hashmap.set('city', 'chester')
      end

      it 'only deletes the identified key from bucket with multiple elements' do
        test_hashmap.remove('name')
        buckets = test_hashmap.buckets
        expect(buckets).to eq([[], [], [], [], [], [], [], [], [], [], [], [{ 'city' => 'chester' }], [], [], [], []])
      end
    end
  end

  describe '#length' do
    before do
      test_hashmap.set('name', 'sophie')
      test_hashmap.set('city', 'chester')
    end

    it 'returns amount of keys in hashmap' do
      hash_length = test_hashmap.length
      expect(hash_length).to eq(2)
    end
  end

  describe '#clear' do
    before do
      test_hashmap.set('name', 'sophie')
      test_hashmap.set('city', 'chester')
    end

    it 'deletes all key, value pairs in hashmap' do
      test_hashmap.clear
      buckets = test_hashmap.buckets
      expect(buckets).to eq([[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []])
    end
  end

  describe '#keys' do
    before do
      test_hashmap.set('name', 'sophie')
      test_hashmap.set('city', 'chester')
    end

    it 'returns an array of all the keys in the hashmap' do
      test_keys = test_hashmap.keys
      expect(test_keys).to eq(%w[name city])
    end
  end

  describe '#values' do
    before do
      test_hashmap.set('name', 'sophie')
      test_hashmap.set('city', 'chester')
    end

    it 'returns an array of all the values in the hashmap' do
      test_values = test_hashmap.values
      expect(test_values).to eq(%w[sophie chester])
    end
  end
end
