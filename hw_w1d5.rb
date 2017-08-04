class Stack

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

class Queue

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

class Map

  def initialize
    @my_map = Array.new
    @keys = @my_map.map {|pair| pair[0]}
  end

  def assign(key, value)
    if @keys.include?(key)
      puts "Already exists"
    else
      @my_map << [key, value]
      @keys = @my_map.map {|pair| pair[0]}
    end
    "This doesn't return anything"
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
    @keys = @my_map.map {|pair| pair[0]}
  end

  def show
    @my_map
  end

end
