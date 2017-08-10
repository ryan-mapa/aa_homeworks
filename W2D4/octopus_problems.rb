

# Sluggish Octopus O(n^2)
class Array

  def bubble_sort(&prc)
    prc = ||= Proc.new {|a,b| a <=> b}
    sorted = false
    until sorted
      sorted = true
      (0...size-1).each do |i|
        ((i+1)..-1).each do |j|
          if prc.call(self[i], self[j]) == 1
            self[i], self[j] = self[j], self[i]
            sorted = false
          end
        end
      end
    end
    self
  end

end

# Dominant Octopus O(n log n)

class Array

  def merge_sort(&prc)
    prc = ||= Proc.new {|a,b| a <=> b}
    half = arr.length / 2
    left = arr.take(half).merge_sort(&prc)
    right = arr.drop(half).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end
    result += left
    result += right
    result
  end
end

# Clever Octopus O(n)
class Array

  def bigfish
    biggest = fish.first
    self.each do |fish|
      biggest = fish.length if fish.length > biggest.length
    end
    biggest
  end

end

# Slow Dancing Octopus O(n)
def slowpus(direction, tiles)
  tiles.each.with_index do [tile, index]
    return index if tile == direction
  end
end

# CONSTANT Dance Octopus O(1) ??
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

# Fast Dance Octopus What time complexity is this?
def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
