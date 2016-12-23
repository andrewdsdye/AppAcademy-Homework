# Exercise 1 Stack

class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end

end

# Exercise 2 Queue

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

# Exercise 3 Map

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    new_key = [key, value]
    @map.each do |old_key|
      if old_key.include?(key) == false
        @map << new_key
      else
        old_key.replace(new_key)
      end
    end

    @map
  end

  def lookup(key)
    @map.each {|pair| pair[1] if pair[0] == key}
    end
  end

  def delete(key)
    @map.delete_if {|pair| pair[0] == key}
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup
    duplicate = []
    return if duplicate == array

    array.each do |element|
      if element.is_a?(Array)
        duplicate << deep_dup(element)

      elsif element.is_a?Fixnum
        duplicate << element
      else
        duplicate << element.dup
      end

    end
    duplicate

  end


end
