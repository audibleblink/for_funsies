module Enumerable
  
  def my_each
    for i in self
      yield(i)
    end  
  end

  def my_reduce(init_value=self[0], operator=nil, &my_block)
    
    if block_given?
      self.my_each do |i|
        init_value = my_block.call(init_value, i)
      end

    elsif operator
      self.my_each do |i|
        init_value = eval("init_value #{operator} #{i}")
      end

    end
    init_value
  end

end


p [*1..5].my_reduce(0) {|sum, i| sum + i}
p (1..5).my_reduce(0, :+)


# my reduce
# pf rec
# bin rec
