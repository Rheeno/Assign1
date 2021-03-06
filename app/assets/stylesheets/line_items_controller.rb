class LineItemsController < ApplicationController
 include CurrentCart
 before_action :set_cart, only: [:create]
before_action :set_line_item, only: [:show, :edit, :update, :destroy]
# GET /line_items
#...

def create
 product = Product.find(params[:product_id])
 @line_item = @cart.line_items.build(product: product)
respond_to do |format|
if @line_item.save
 format.html { redirect_to @line_item.cart,
notice: 'Line item was successfully created.' }
format.json { render action: 'show',
status: :created, location: @line_item }
else
format.html { render action: 'new' }
format.json { render json: @line_item.errors,
status: :unprocessable_entity }
end
end
test "should create line_item" do
assert_difference('LineItem.count') do
 post :create, product_id: products(:ruby).id
end
 assert_redirected_to cart_path(assigns(:line_item).cart)
end
end