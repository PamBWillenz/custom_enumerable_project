module Enumerable
  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end
  
  def my_count
    return size unless block_given?
    count = 0
    my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    mapped = []
    my_each do |element|
      mapped << yield(element)
    end
    mapped
  end

  def my_inject(accumulator = nil)
    my_each do |element|
      accumulator = if accumulator.nil?
                      element
                    else
                      yield(accumulator, element)
                    end
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.each do |element|
      yield(element)
    end
    self
  end

  def my_each_with_index
    self.each_with_index do |element, index|
      yield(element, index)
    end
    self
  end

  def my_select
    selected = []
    my_each do |element|
      selected << element if yield(element)
    end
    selected
  end
end
