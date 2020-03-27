require 'pry'

def find_item_by_name_in_collection(name, collection)

  i = 0
  while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1

  end


  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  unique = {}
  i = 0
  while i < cart.length do
    if unique[cart[i][:item]]
      unique[cart[i][:item]] += 1
    else unique[cart[i][:item]] = 1
    end
    i += 1
  end

  ind = 0
  while ind < cart.length do
    if unique.include?(cart[ind][:item])
      cart[ind][:count] = unique[cart[ind][:item]]
    end
    ind += 1
  end

cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  while i < cart.length do
    ind = 0
    while ind < coupons.length do
      if cart[i][:item] == coupons[ind][:item]
        counter = cart[i][:count]
        number = coupons[ind][:num]

        hash = {
          :item => "#{coupons[ind][:item]} W/COUPON",
          :clearance => cart[i][:clearance],
          :count => number,
          :price => coupons[ind][:cost]/number
        }

        # if counter <= number
        #   diff = counter - number
        # end

        cart[i][:count] = 0
        cart << hash


      end
      ind += 1
    end

    i += 1
  end



  cart


end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  while i < cart.length do
    if cart[i][:clearance] == true
      product = cart[i][:price] * 0.8
      cart[i][:price] = product.round(2)

    end
    i += 1
  end

cart

  # binding.pry

end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
#   new_cart = consolidate_cart(cart)
#   couponed = apply_coupons(new_cart, coupons)
#   final = apply_clearance(couponed)
#   total = 0
#   i = 0
#   while i < final.length do
#       item_num = new_cart[i][:count]
#       item_price = new_cart[i][:price].round(2)
#       total += (item_price * item_num)
#       i += 1
#   end
#
# if total > 100
#   total = (total-(total*0.1)).round(2)
# end
#   # binding.pry
#
# end

consolidated_cart = consolidate_cart(cart)
 coupon_applied_cart = apply_coupons(consolidated_cart, coupons)
 final_cart = apply_clearance(coupon_applied_cart)
 total = 0
 item_index = 0
 while final_cart[item_index] do
   item = final_cart[item_index]
   total += item[:price] * item[:count]
   item_index += 1
 end
 if total > 100
   total -= total * 0.1
 end
 total
end
