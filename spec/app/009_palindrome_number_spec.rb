RSpec.describe 'PalindromeNumber' do
  let(:x) { Class.new { extend AlgorithmPalindromeNumber } }

  context 'algorithm of palindrome number' do
    it 'with test case 01' do
      expect(x.is_palindrome_a(121)).to eq true
      expect(x.is_palindrome_b(121)).to eq true
    end

    it 'with test case 02' do
      expect(x.is_palindrome_a(-121)).to eq false
      expect(x.is_palindrome_b(-121)).to eq false
    end

    it 'with test case 03' do
      expect(x.is_palindrome_a(10)).to eq false
      expect(x.is_palindrome_b(10)).to eq false
    end
  end
end
