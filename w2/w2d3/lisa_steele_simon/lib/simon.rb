class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    while @game_over == false 
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    if @game_over == false 
      self.show_sequence
      self.require_sequence
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    puts "Try to repeat back the sequence of colors you see on the screen"
    puts "for example:red blue green yellow"
    user_input = gets.chomp 
    guesses = user.input.split 
    guesses.each do |guess| 
      @seq.each do |color|
        if guess != color
          @game_over = true 
        end
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample 
  end

  def round_success_message
    puts "congratulations, you are a CHAMPION!!!!"
  end

  def game_over_message
    puts "oh man, you lost! :("
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end
