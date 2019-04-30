require_relative 'mancala'
require_relative 'player'
require "byebug"
class Board
  attr_accessor :cups, :name1, :name2
  #     12 11 10 9  8  7
  # 13                     6
  #     0  1  2  3  4  5
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    @cups.each.with_index do |cup, idx|
      if idx != 6 && idx != 13 
        cups[idx] = [:stone, :stone, :stone, :stone]
      else 
        cups[idx] = []
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0 
      raise "Invalid starting cup"
    elsif @cups[start_pos].length == 0
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].count 
    @cups[start_pos] = []
    
    if start_pos <= 6
      start_pos = start_pos - 1
    end

    i = 0 
    if current_player_name == name1
      range = (0..12).to_a 
      turn_end_pos = (start_pos + stone_count) % 12 
      range[start_pos + 1..turn_end_pos].each do |i|
        @cups[i] += [:stone]
      end
      if @cups[turn_end_pos].empty?
        :switch 
      else
        turn_end_pos
      end 
      return :prompt if turn_end_pos == 13
      self.next_turn(turn_end_pos)
    else
      range = (0..5).to_a + (7..13).to_a
      turn_end_pos = (start_pos + stone_count) % 12 
      range[start_pos + 1..turn_end_pos].each do |i|
        @cups[i] += [:stone]
      end
      if @cups[turn_end_pos].empty?
        :switch 
      else
        turn_end_pos 
      end 
      return :prompt if turn_end_pos == 6 
      self.next_turn(turn_end_pos)
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    self.render 
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = (0..5).to_a
    side2 = (7..12).to_a
    side1.all? { |i| @cups[i].empty? } || side2.all? { |i| @cups[i].empty? }
    
  end

  def winner
    if @cups[6].count == @cups[13].count 
      return :draw 
    end
    @cups[6].count > @cups[13].count ? self.name1 : self.name
  end
end
# def make_move(start_pos, current_player_name)
#     stone_count = @cups[start_pos].count 
#    #debugger
#     @cups[start_pos] = [] 
#     cup_indices = (0..13).to_a
#     i = start_pos + 1
#     indices = cup_indices[i..-1] + cup_indices[0...i]
#     if current_player_name == self.name1
#       while stone_count > 0
#         if i != 13
#           @cups[i] += [:stone]
#           i += 1
#           stone_count -= 1
#         else
#           i += 1
#         end
#         i = i
#       end
#       next_turn(i)
#     else
#       while stone_count > 0
#         if i != 6
#           @cups[i] += [:stone]
#           i += 1
#           stone_count -= 1
#         else
#           i += 1
#         end
#         i = i
#       end
#       next_turn(i)
#     end
#     if @cups[i].empty?
#         return :switch 
#       elsif i == 6
#         return :prompt 
#       elsif !@cups[i].empty?
#         return i 
#       end
#   end