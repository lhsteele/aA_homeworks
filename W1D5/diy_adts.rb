require "byebug"

class Stack
  #LIFO
  def initialize(stack)
    @stack = stack 
  end

  def push(el)
    @stack << el  
  end

  def pop 
    @stack.pop 
  end

  def peek 
    @stack.last  
  end

end

class Queue
  #FIFO
  attr_reader :queue
  def initialize(queue)
    @queue = queue 
  end

  def enqueue(el)
    @queue << el 
  end

  def dequeue
    @queue.shift 
  end

  def peek  
    @queue.first
  end

end

class Map 
  def initialize
    @map = Array.new 
    
  end 

  def set(key, value)
    if @map.length == 0
      @map << [key, value]
    else
      @map.each do |subarr|
        if subarr[0] == key
          subarr[1] = value
          return
        end
      end
      @map << [key, value]
    end
  end

  def get(key)
    @map.each do |subarr|
      if subarr[0] == key 
        print subarr
      end
    end
  end

  def delete(key)
    @map.each.with_index do |subarr, idx|
      if subarr[0] == key 
        @map.delete_at(idx)
      end
    end
  end

  def show 
    print @map
  end

end

