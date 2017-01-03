class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, index|
      4.times do
        cup << :stone
        if index == 6
          cup = []
        elsif index == 13
          cup = []
        end
      end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0
    raise "Invalid starting cup" if start_pos > 12
    raise "Invalid starting cup" if @cups[starting_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup = start_pos
    until stones.empty?
      cup += 1
      cup = 0 if cup > 13
      if cup == 6
        @cups[6] << stones.shift if current_player_name == @name1
      elsif cup == 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[cup] << stones.shift
      end
    end
    render
    next_turn(cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx] == 1
      :switch
    elsif ending_cup_idx == 13
      :prompt
    elsif ending_cup_idx == 6
      :prompt
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? { |cup| cup.empty? } ||
    @cups[7...13].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count
    if player1_score > player2_score
      @name1
    elsif player2_score > player1_score
      @name2
    else
      :draw
    end
  end
end
