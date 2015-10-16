def filter(array:, value:)
  return [] if array.empty?
  result = []
  array.each do |item|
    if item == value
      result << item
    end
  end
  return result
end

def exclude(array:, value:)
  return [] if array.empty?
  result = []
  array.each do |item|
    if item != value
      result << item
    end
  end
  return result
end

def unique(array:)

end

p exclude(array:['kult', 'jut'], value:'jut')