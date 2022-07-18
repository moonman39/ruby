def stock_picker(array)
  profit = 0
  stock_picks = []
  array.each_with_index do |price, index|
    array.each do |compare_price|
      if index < array.index(compare_price) && price < compare_price
        if compare_price - price > profit
          profit = compare_price - price
          stock_picks[0] = array.index(price)
          stock_picks[1] = array.index(compare_price)
        end
      end
    end
  end
  stock_picks
end

p stock_picker([17,3,6,9,15,8,6,5,10,1])