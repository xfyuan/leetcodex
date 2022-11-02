RSpec.describe 'RegularSortings' do
  let(:x) { Class.new { extend RegularSortings } }

  let(:nums) { [-500, -481, -480, -469, -437, -423, -408, -403, -397, -381, -379, -377, -353, -347, -337, -327, -313, -307, -299, -278, -265, -258, -235, -227, -225, -193, -192, -177, -176, -173, -170, -164, -162, -157, -147, -118, -115, -83, -64, -46, -36, -35, -11, 0, 0, 33, 40, 51, 54, 74, 93, 101, 104, 105, 112, 112, 116, 129, 133, 146, 152, 157, 158, 166, 177, 183, 186, 220, 263, 273, 320, 328, 332, 356, 357, 363, 372, 397, 399, 420, 422, 429, 433, 451, 464, 484, 485, 498, 499] }
  let(:result) { [-500, -481, -480, -469, -437, -423, -408, -403, -397, -381, -379, -377, -353, -347, -337, -327, -313, -307, -299, -278, -265, -258, -235, -227, -225, -193, -192, -177, -176, -173, -170, -164, -162, -157, -147, -118, -115, -83, -64, -46, -36, -35, -11, 0, 0, 33, 40, 51, 54, 74, 93, 101, 104, 105, 112, 112, 116, 129, 133, 146, 152, 157, 158, 166, 177, 183, 186, 220, 263, 273, 320, 328, 332, 356, 357, 363, 372, 397, 399, 420, 422, 429, 433, 451, 464, 484, 485, 498, 499] }

  context 'regular sortings' do
    it 'with array only have less than 2 elements' do
      expect(x.bubble_sorting([])).to eq([])
      expect(x.bubble_sorting([5])).to eq([5])

      expect(x.selection_sorting([])).to eq([])
      expect(x.selection_sorting([5])).to eq([5])

      expect(x.insertion_sorting([])).to eq([])
      expect(x.insertion_sorting([5])).to eq([5])
    end

    it 'with array have more than 2 elements' do
      expect(x.bubble_sorting(nums)).to eq(result)
      expect(x.selection_sorting(nums)).to eq(result)
      expect(x.insertion_sorting(nums)).to eq(result)
    end
  end
end
