class Stack #stack ADT implemented with an array

  def initialize
    @stack = Array.new
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end

class Queue #queue ADT implemented with an array

  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end

end

class Map #map ADT implemented with an array of 2 element arrays

  def initialize
    @my_map = Array.new
    update_keys
  end

  def update_keys
    @keys = @my_map.map {|pair| pair[0]}
  end

  def assign(key, value)
    if @keys.include?(key)
      puts "Already exists"
    else
      @my_map << [key, value]
      update_keys
    end
    "Key and value added. (Or not)"
  end

  def lookup(key)
    if @keys.include?(key)
      return @my_map.select {|pair| pair[0] == key}
    else
      puts "No such key pair"
    end
  end

  def remove(key)
    @my_map = @my_map.reject {|pair| pair[0] == key}
    update_keys
  end

  def show
    @my_map
  end

end
