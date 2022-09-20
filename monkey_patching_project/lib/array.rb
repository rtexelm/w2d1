# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return if self.empty?
    self.max - self.min
  end

  def average
    return if self.empty?
    self.sum(0.0) / self.length 
  end

  def median
    return if self.empty?
    middle = self.size / 2
    if self.size.odd?
        return self.sort[middle]
    end
    self.sort[middle - 1..middle].sum(0.0) / 2
  end

  def counts
    self.to_h {|e| [e, self.count(e)]}
  end

  def my_count(val)
    count = 0
    self.each {|v| count += 1 if v == val}
    count
  end

  def my_index(val)
    self.each_with_index {|v, i| return i if v == val}
    return
  end

  def my_uniq
    uniqs = []
    self.each_with_index do |e, i|
        self.each_with_index do |e2, i2|
            if !(i != i2 && e == e2) && !uniqs.include?(e)
                uniqs << e
            end
        end
    end
    uniqs
  end

  def my_transpose
    (0...self.length).map do |i|
      self.map do |sub|
        sub[i]
      end
    end
  end

end




            


