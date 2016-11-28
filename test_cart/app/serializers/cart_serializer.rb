class CartSerializer < ApplicationSerializer
  attributes :id, :product_name, :category, :url

  def url
    url_helpers.cart_path(object)
  end
end
