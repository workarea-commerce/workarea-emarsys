json.email current_user&.email
json.emarsys_cart_items current_order.items do |item|
  json.item item.product_id
  json.quantity item.quantity
  json.price item.total_price.amount.to_f
end
