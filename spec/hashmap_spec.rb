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

  describe '#get' do
    context 'when a key is inputted' do
      before do
        test_hashmap.set('me', 'sophie')
      end

      it 'returns the value' do
        key = 'me'
        value = test_hashmap.get(key)
        expect(value).to eq('sophie')
      end
    end
  end
end
