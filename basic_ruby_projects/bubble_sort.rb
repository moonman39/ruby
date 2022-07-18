# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort 
# methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(array)
  sorted = false
  while sorted == false
    counter = 0
    array.each_with_index do |number, index|
      if index == array.length - 1
        next
      elsif
        number > array[index + 1]
        array.insert(index + 2, number)
        array.delete_at(index)
        counter += 1
      end
    end
    p array
    sorted = true if counter == 0
  end
end

bubble_sort([5, 4, 1000, -10, 3, 2, 1, 10, 100])

