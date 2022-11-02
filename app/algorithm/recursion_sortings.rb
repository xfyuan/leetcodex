require 'bundler/setup'
Bundler.require

module ResursionSortings
  # 归并排序是建立在归并操作上的一种有效的排序算法。
  # 该算法是采用分治法的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。
  def merge_sorting(nums)
    return nums if nums.size < 2

    i = (nums.size / 2).floor
    left = merge_sorting(nums[0..i - 1])
    right = merge_sorting(nums[i..nums.size])
    merge(left, right)
  end

  # 快速排序是一个知名度极高的排序算法，其对于大数据的优秀排序性能和相同复杂度算法中相对简单的实现，使它注定得到比其他算法更多的宠爱。
  # 从数列中挑出一个元素，称为"基准"（pivot）
  # 重新排序数列，所有比基准值小的元素摆放在基准前面，所有比基准值大的元素摆在基准后面（相同的数可以到任何一边）。在这个分区结束之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
  # 递归地把小于基准值元素的子数列和大于基准值元素的子数列排序。
  def quick_sorting(nums)
    return nums if nums.size < 2

    pivot = nums.delete_at rand(nums.size)

    left = Array.new
    right = Array.new

    nums.each do |n|
      n < pivot ? left << n : right << n
    end

    [*quick_sorting(left), pivot, *quick_sorting(right)]
  end

  private

  def merge(left, right)
    return left if right.empty?
    return right if left.empty?

    if left[0] < right[0]
      [left[0]] + merge(left[1..left.size], right)
    else
      [right[0]] + merge(left, right[1..right.size])
    end
  end
end
