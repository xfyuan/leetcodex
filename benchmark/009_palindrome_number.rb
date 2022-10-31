require 'bundler/setup'
Bundler.require

require './app/009_palindrome_number.rb'

# Warming up --------------------------------------
# algorithm A of palindrome number
#                         53.240k i/100ms
# algorithm B of palindrome number
#                         50.140k i/100ms
# Calculating -------------------------------------
# algorithm A of palindrome number
#                         528.243k (± 1.8%) i/s -      2.662M in   5.041023s
# algorithm B of palindrome number
#                         496.768k (± 1.8%) i/s -      2.507M in   5.048321s
#
# Comparison:
# algorithm A of palindrome number:   528242.7 i/s
# algorithm B of palindrome number:   496767.9 i/s - 1.06x  (± 0.00) slower

def algorithm_a
  x = Class.new { extend AlgorithmPalindromeNumber }
  x.is_palindrome_a(121)
  x.is_palindrome_a(-121)
  x.is_palindrome_a(10)
end

def algorithm_b
  x = Class.new { extend AlgorithmPalindromeNumber }
  x.is_palindrome_b(121)
  x.is_palindrome_b(-121)
  x.is_palindrome_b(10)
end

Benchmark.ips do |x|
  x.report("algorithm A of palindrome number") { algorithm_a }
  x.report("algorithm B of palindrome number") { algorithm_b }
  x.compare!
end
