require 'bundler/setup'
Bundler.require

module RegularSortings
  # 冒泡排序是一种简单的排序算法。
  # 它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。
  # 走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。
  # 这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
  def bubble_sorting(nums)
    return nums if nums.size < 2

    swap = true
    # 只要swap不为false，就说明都有冒泡交换，就继续循环
    while swap
      swap = false
      (nums.size - 1).times do |i|
        if nums[i] > nums[i + 1]
          nums[i], nums[i + 1] = nums[i + 1], nums[i]
          swap = true
        end
      end
    end
    nums
  end

  # 选择排序是一种简单直观的排序算法，
  # 它也是一种交换排序算法，和冒泡排序有一定的相似度，可以认为选择排序是冒泡排序的一种改进。
  # 在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
  # 从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
  # 重复上一步，直到所有元素均排序完毕。
  def selection_sorting(nums)
    return nums if nums.size < 2

    n = nums.size - 1
    n.times do |i|
      min_idx = i
      # for 循环找到 i 之后的最小元素
      for j in (i + 1)..n do
        min_idx = j if nums[j] < nums[min_idx]
      end
      if min_idx != i
        nums[i], nums[min_idx] = nums[min_idx], nums[i]
      end
    end
    nums
  end

  # 插入排序是一种简单直观的排序算法。
  # 它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
  # 把待排序的数组分成已排序和未排序两部分，初始的时候把第一个元素认为是已排好序的。
  # 从第二个元素开始，在已排好序的子数组中寻找到该元素合适的位置并插入该位置。
  # 重复上述过程直到最后一个元素被插入有序子数组中。
  def insertion_sorting(nums)
    return nums if nums.size < 2

    (nums.size).times do |i|
      # 把第一个元素认为是已排好序的
      next if i == 0

      # 对前 i 个元素从后向前扫描，找到相应位置并插入。
      for j in i..1 do
        if nums[j - 1] > nums[j]
          nums[j], nums[j - 1] = nums[j - 1], nums[j]
        end
      end
    end
    nums
  end
end
