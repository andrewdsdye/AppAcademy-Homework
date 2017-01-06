class LRUCache
  attr_reader :cache, :size

  def initialize(cache = [], size)
    @cache = cache
    @size = size
  end

  def count
    # returns number of elements currently in cache
    cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      cache.delete(el)
    elsif size <= count
      cache.shift
    end

    cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p cache
  end

  private
  # helper methods go here!

end
