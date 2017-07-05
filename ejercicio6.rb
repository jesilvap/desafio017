class Product
   attr_accessor :name, :value
   #def initialize(name, large, medium, small, xsmall)
   def initialize(name, *value)
   @name = name
   @value = value.map(&:to_i)
   #@large = large.map(&:to_i)
   #@medium = medium.map(&:to_i)
   #@small = small.map(&:to_i)
   #@xsmall = xsmall.map(&:to_i)
   end
   def average
     @value.inject(&:+) / @value.size.to_f
   end
end

products_list = []
data = []

#File.open('catalogo.txt', 'r') { |file| data = file.readlines}
file = File.open('catalogo.txt', 'r')
data = file.readlines
file.close

data.each do |prod|
 ls = prod.split(', ')
 products_list << Product.new(*ls)
end

products_list.each do |prod|
  puts prod.name
  puts prod.average
end
