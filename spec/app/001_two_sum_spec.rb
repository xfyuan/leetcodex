RSpec.describe 'TwoSum' do
  let(:x) { Class.new { extend AlgorithmTwoSum } }

  context 'algorithm of two sum' do
    it 'with test case 01' do
      expect(x.two_sum_a([2, 7, 11, 15], 9)).to eq([0, 1])
      expect(x.two_sum_b([2, 7, 11, 15], 9)).to eq([0, 1])
    end

    it 'with test case 02' do
      expect(x.two_sum_a([3, 2, 4], 6)).to eq([1, 2])
      expect(x.two_sum_b([3, 2, 4], 6)).to eq([1, 2])
    end

    it 'with test case 03' do
      expect(x.two_sum_a([3, 3], 6)).to eq([0, 1])
      expect(x.two_sum_b([3, 3], 6)).to eq([0, 1])
    end
  end
end
