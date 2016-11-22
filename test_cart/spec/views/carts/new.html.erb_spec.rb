require 'rails_helper'

RSpec.describe "carts/new", type: :view do
  before(:each) do
    assign(:cart, Cart.new(
      :product_name => "MyString",
      :category => "MyString"
    ))
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do

      assert_select "input#cart_product_name[name=?]", "cart[product_name]"

      assert_select "input#cart_category[name=?]", "cart[category]"
    end
  end
end
