class Stack
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
    @stack.first 
  end

end

p stack = Stack.new([1, 2, 3, 4])
stack.push(5)
p stack 
p stack.pop
p stack 
p stack.peek
