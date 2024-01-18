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
end
