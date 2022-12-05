class Sorter
	attr_reader :priority

	def initialize(input)
		@input = input
		@priority = 0
	end

	def run!
		@input.lines.each do |line|
			match = find_unique_match(line)
			@priority += calculate_priority(match)
		end
	end

private
	def find_unique_match(line)
		chunk = line.strip
		chars =chunk.chars
		size = chunk.size / 2
		parts = chars.each_slice(size).map(&:to_a)
		parts[0].intersection(parts[1]).first
	end

	def calculate_priority(match)
		is_upper = /[[:upper:]]/.match(match)
		is_upper ? (match.ord - 38) : (match.ord - 96)
	end
end

input = File.read('input.txt')
sorter = Sorter.new(input)
sorter.run!

puts sorter.priority