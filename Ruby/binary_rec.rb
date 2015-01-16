# hopefully the descriptive names eliminate the need for comment

def search(set, item_im_searching_for, lower_index=0, upper_index=set.length)

  middle_index   = (lower_index + upper_index) / 2
  middle_item = set[middle_index]

  return middle_index if middle_item == item_im_searching_for
  return -1 if upper_index <= lower_index

  return item_im_searching_for < middle_item ? \
    search( set, item_im_searching_for, lower_index, middle_index-1 ) : \
    search( set, item_im_searching_for, middle_index+1, upper_index )

end


p search([1,2,3,5,6,7,8], 4) == -1
p search([1,2,3,5,6,7,8], 0) == -1
p search([1,2,3,5,6,7,8], 9) == -1
p search([1,2,3,5,6,7,8], 6) ==  4
