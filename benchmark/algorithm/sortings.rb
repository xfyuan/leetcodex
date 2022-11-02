require 'bundler/setup'
Bundler.require

require './app/algorithm/regular_sortings.rb'
require './app/algorithm/recursion_sortings.rb'

# Warming up --------------------------------------
#       bubble sorting     1.000  i/100ms
#    selection sorting     1.000  i/100ms
#    insertion sorting   431.000  i/100ms
#        merge sorting    12.000  i/100ms
#        quick sorting    48.000  i/100ms
# Calculating -------------------------------------
#       bubble sorting     14.503k (± 5.3%) i/s -     71.805k in   4.985550s
#    selection sorting     15.123  (± 0.0%) i/s -     76.000  in   5.025585s
#    insertion sorting      6.714k (± 2.5%) i/s -     33.618k in   5.010619s
#        merge sorting    261.303  (± 3.1%) i/s -      1.308k in   5.011132s
#        quick sorting    674.382k (±34.4%) i/s -      1.982M in   4.991402s
#
# Comparison:
#        quick sorting:   674381.8 i/s
#       bubble sorting:    14503.3 i/s - 46.50x  (± 0.00) slower
#    insertion sorting:     6713.9 i/s - 100.45x  (± 0.00) slower
#        merge sorting:      261.3 i/s - 2580.84x  (± 0.00) slower
#    selection sorting:       15.1 i/s - 44594.11x  (± 0.00) slower

UNSORT = Array.new(3000) { rand(1..3000) }

def bubble_sorting
  x = Class.new { extend RegularSortings }
  x.bubble_sorting(UNSORT)
end

def selection_sorting
  x = Class.new { extend RegularSortings }
  x.selection_sorting(UNSORT)
end

def insertion_sorting
  x = Class.new { extend RegularSortings }
  x.insertion_sorting(UNSORT)
end

def merge_sorting
  x = Class.new { extend ResursionSortings }
  x.merge_sorting(UNSORT)
end

def quick_sorting
  x = Class.new { extend ResursionSortings }
  x.quick_sorting(UNSORT)
end

Benchmark.ips do |x|
  x.report("bubble sorting")   { bubble_sorting }
  x.report("selection sorting"){ selection_sorting }
  x.report("insertion sorting"){ insertion_sorting }
  x.report("merge sorting")    { merge_sorting }
  x.report("quick sorting")    { quick_sorting }
  x.compare!
end
