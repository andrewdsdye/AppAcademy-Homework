array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)
  biggest_fish = ""
  array.each_with_index do |fish1, index1|
    array.each_with_index do |fish2, index2|
      next if index1 == index2
      biggest_fish = fish1 if fish1.length > fish2.length && fish1.length > biggest_fish.length
    end
  end

  biggest_fish
end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new { x <=> y }
    return self if count <= 1
    midpoint = count / 2

    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant_octopus(array)
  prc = Proc.new { |x, y| x.length <=> y.length }
  biggest_fish = array.merge_sort(&prc).last
  biggest_fish
end

def clever_octopus(array)
  biggest_fish = ""
  array.each do |fish|
    biggest_fish = fish if fish.length > biggest_fish.length
  end

  biggest_fish
end

p sluggish_octopus(array)
p dominant_octopus(array)
p clever_octopus(array)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(target, array)
  array.each_with_index do |tile, index|
    return index if tile == target
  end
end

# def fast_dance(target, array)
#   i = 0
#   until i == array.length
#     return i if array[i] == target
#     i += 1
#   end
# end

# def tiles_array_to_hash(array)
#   tiles = Hash.new
#   array.each_with_index do |tile, index|
#     tiles[tile] = index
#   end
#   tiles
# end

def tiles_array_to_hash(array)
  tiles = Hash.new
  i = 0
  until i == array.length
    tiles[array[i]] = i
    i += 1
  end
  tiles
end

tiles_hash = tiles_array_to_hash(tiles_array)

def fast_dance(hash, target)
  hash[target]
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
# p fast_dance("up", tiles_array)
# p fast_dance("right-down", tiles_array)
p fast_dance(tiles_hash, "up")
p fast_dance(tiles_hash, "right-down")
