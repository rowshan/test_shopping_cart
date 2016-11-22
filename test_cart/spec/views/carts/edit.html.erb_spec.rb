require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :product_name => "MyString",
      :category => "MyString"
    ))
  end

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do

      assert_select "input#cart_product_name[name=?]", "cart[product_name]"

      assert_select "input#cart_category[name=?]", "cart[category]"
    end
  end
end
