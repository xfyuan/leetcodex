require 'bundler/setup'
Bundler.require

require './app/algorithm/regular_sortings.rb'

NUMS = [-500,-481,-480,-469,-437,-423,-408,-403,-397,-381,-379,-377,-353,-347,-337,-327,-313,-307,-299,-278,-265,-258,-235,-227,-225,-193,-192,-177,-176,-173,-170,-164,-162,-157,-147,-118,-115,-83,-64,-46,-36,-35,-11,0,0,33,40,51,54,74,93,101,104,105,112,112,116,129,133,146,152,157,158,166,177,183,186,220,263,273,320,328,332,356,357,363,372,397,399,420,422,429,433,451,464,484,485,498,499]

# Warming up --------------------------------------
#       bubble sorting    20.394k i/100ms
#    selection sorting   669.000  i/100ms
#    insertion sorting    11.463k i/100ms
# Calculating -------------------------------------
#       bubble sorting    203.789k (± 1.0%) i/s -      1.020M in   5.004214s
#    selection sorting      6.693k (± 0.1%) i/s -     34.119k in   5.097643s
#    insertion sorting    113.853k (± 1.8%) i/s -    573.150k in   5.035765s
#
# Comparison:
#       bubble sorting:   203788.9 i/s
#    insertion sorting:   113853.4 i/s - 1.79x  (± 0.00) slower
#    selection sorting:     6693.1 i/s - 30.45x  (± 0.00) slower

def bubble_sorting
  x = Class.new { extend RegularSortings }
  x.bubble_sorting(NUMS)
end

def selection_sorting
  x = Class.new { extend RegularSortings }
  x.selection_sorting(NUMS)
end

def insertion_sorting
  x = Class.new { extend RegularSortings }
  x.insertion_sorting(NUMS)
end

Benchmark.ips do |x|
  x.report("bubble sorting") { bubble_sorting }
  x.report("selection sorting") { selection_sorting }
  x.report("insertion sorting") { insertion_sorting }
  x.compare!
end
