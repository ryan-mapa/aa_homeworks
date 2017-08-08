class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 0.3
    end
  end

  def require_sequence
    guess = []
    puts "Your turn."
    begin
      @seq.each do |color|
        puts
        guess = gets.chomp
        system("clear")
        raise "Not a valid color." if COLORS.include?(guess) == false
        game_over_message if guess != color
      end
    rescue
      puts "not a valid color. start over."
      retry
    end
  end

  def add_random_color
    choose = rand(3)
    seq << COLORS[choose]
  end

  def round_success_message
    puts "Nice. Next round!"
    sleep 0.5
  end

  def game_over_message
    puts "You lose, but nice try. You got #{sequence_length} points!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play
