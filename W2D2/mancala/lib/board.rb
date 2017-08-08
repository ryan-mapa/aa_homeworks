require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    4.times do
        (0...14).each {|idx| @cups[idx] << :stone unless idx == 6 || idx == 13}
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1,6) || start_pos.between?(7,12)
      raise Exception, "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    idx = start_pos
    stones = @cups[start_pos].count
    @cups[start_pos] = []
    dummy = []
    stones.times {dummy << :stone}

    until dummy.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[6] << dummy.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << dummy.pop if current_player_name == @name2
      else
        @cups[idx] << dummy.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count == 1
    return ending_cup_idx if @cups[ending_cup_idx].count > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|cup| cup.empty?} ||
    @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    one = @cups[6].count
    two = @cups[13].count
    return :draw if one == two
    # byebug
    one > two ? @name1 : @name2
  end
end
