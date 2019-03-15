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


