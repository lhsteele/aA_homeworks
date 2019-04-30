require "byebug"

class LRUCache
  def initialize(size)
    @size = size 
    @cache = Array.new(size) { Array.new }
  end

  def count 
    @cache.count 
  end

  def add(el)
    if @cache.count == @size 
      @cache.shift 
    end
    if already_cached?(el)
      #if it's already cached, I want to find the existing el and remove it
      #shovel the new el at the end
      remove_old(el)
      @cache << el
    else 
      @cache << el 
    end
  end

  def show 
    print @cache
  end

  private 
  #helper methods
  def already_cached?(old_el)
    @cache.include?(old_el)
  end

  def remove_old(old_el)
    @cache.delete(old_el)
  end

end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count 

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show