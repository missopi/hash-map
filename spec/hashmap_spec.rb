# frozen_string_literal: true

require_relative '../lib/hashmap'

describe HashMap do
  subject(:test_hashmap) { described_class.new }

  describe '#initialize' do
    context 'new_array' do
      it 'will be empty' do
        cells = test_hashmap.buckets
        expect(cells).to all(be_nil)
      end
    end

    context 'new array' do
      it 'will have 16 cells' do
        cells = test_hashmap.buckets.size
        expect(cells).to eq(16)
      end
    end
  end
end
