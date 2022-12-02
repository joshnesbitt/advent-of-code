# 🪨
# 🧻
# ✂️

# A for Rock
# B for Paper
# C for Scissors

# X for Rock (1)
# Y for Paper (2 )
# Z for Scissors (3)

# Lose equals 0
# Draw equals 3
# Win equals 6

class Game
	GAME_RULES = {
		rock: [ :scissors ],
		paper: [ :rock ],
		scissors: [ :paper ]
	}

	PLAYER_KEY = {
		"X" => :rock,
		"Y" => :paper,
		"Z" => :scissors
	}

	OPPONENT_KEY = {
		"A" => :rock,
		"B" => :paper,
		"C" => :scissors
	}

	SCORE_KEY = {
		rock: 1,
		paper: 2,
		scissors: 3,
		lose: 0,
		draw: 3,
		win: 6
	}

	SCORE_KEY.default = 0

	attr_reader :score

	def initialize(turns)
		@turns = turns
		@score = 0
	end

	def take_turn(turn)
		parts = turn.strip.split(' ')
		opponent_choice = OPPONENT_KEY[parts.first]
		player_choice = PLAYER_KEY[parts.last]

		if opponent_choice == player_choice
			outcome = :draw
		elsif GAME_RULES[player_choice].include?(opponent_choice)
			outcome = :win
		else
			outcome = :lose
		end

		@score += SCORE_KEY[outcome]
		@score += SCORE_KEY[player_choice]

		puts %{Turn played: "#{player_choice}" vs "#{opponent_choice}". Outcome was #{outcome}.}
	end

	def play!
		@turns.lines.each do |line|
			take_turn(line)
		end
	end
end

input = File.read('input.txt')
game = Game.new(input)
game.play!

puts
puts "Final score: #{game.score}"
