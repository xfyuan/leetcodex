require 'bundler/setup'
Bundler.require

require './app/001_two_sum.rb'

# Warming up --------------------------------------
# algorithm A of two sum
#                         31.782k i/100ms
# algorithm B of two sum
#                         34.359k i/100ms
# Calculating -------------------------------------
# algorithm A of two sum
#                         318.860k (± 2.1%) i/s -      1.621M in   5.085723s
# algorithm B of two sum
#                         343.639k (± 2.3%) i/s -      1.718M in   5.002084s
#
# Comparison:
# algorithm B of two sum:   343639.1 i/s
# algorithm A of two sum:   318859.7 i/s - 1.08x  (± 0.00) slower

def algorithm_a
  x = Class.new { extend AlgorithmTwoSum }
  x.two_sum_a([2, 7, 11, 15], 9)
  x.two_sum_a([3, 2, 4], 6)
  x.two_sum_a([3, 3], 6)
end

def algorithm_b
 x = Class.new { extend AlgorithmTwoSum }
 x.two_sum_b([2, 7, 11, 15], 9)
 x.two_sum_b([3, 2, 4], 6)
 x.two_sum_b([3, 3], 6)
end

Benchmark.ips do |x|
  x.report("algorithm A of two sum") { algorithm_a }
  x.report("algorithm B of two sum") { algorithm_b }
  x.compare!
end
