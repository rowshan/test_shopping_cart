require 'rails_helper'

RSpec.describe "carts/index", type: :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :product_name => "Product Name",
        :category => "Category"
      ),
      Cart.create!(
        :product_name => "Product Name",
        :category => "Category"
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
