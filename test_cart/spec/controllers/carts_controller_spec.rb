require 'rails_helper'


RSpec.describe CartsController, type: :controller do
  let!(:valid_attributes) { { :product_name => "MyText"} }
  let(:valid_session) { {} }
  let(:invalid_attributes) {{ :product_name=>nil}}

  describe "GET #index" do
    let!(:cart) {create :cart}
    it "assigns all carts as @carts" do
      get :index, params: {}, session: valid_session
      expect(assigns(:carts)).to eq([cart])
    end
  end

  describe "GET #show" do
    let!(:cart) {create :cart}
    it "assigns the requested cart as @cart" do
      get :show, params: {id: cart.to_param}, session: valid_session
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe "GET #new" do
    it "assigns a new cart as @cart" do
      get :new, params: {}, session: valid_session
      expect(assigns(:cart)).to be_a_new(Cart)
    end
  end



  describe "POST #create" do

    context "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, params: {cart: valid_attributes }, session: valid_session
        }.to change(Cart, :count).by(1)
      end

      it "assigns a newly created cart as @cart" do
        post :create, params: {cart: valid_attributes }, session: valid_session
        expect(assigns(:cart)).to be_a(Cart)
        expect(assigns(:cart)).to be_persisted
      end

      it "redirects to the created cart" do
        post :create, params: {cart: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Cart.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved cart as @cart" do
        post :create,params:{cart: invalid_attributes}, session: valid_session
        expect(assigns(:cart)).to be_a_new(Cart)
      end

      it "re-renders the 'new' template" do
        post :create,params: {cart: invalid_attributes}.update(product_name:nil), session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:cart) {create :cart}

    it "destroys the requested cart" do
      expect {
        delete :destroy, params: {id: cart.to_param}, session: valid_session
      }.to change(Cart, :count).by(-1)
    end


    it "redirects to the carts list" do
      delete :destroy, params: {id: cart.to_param}, session: valid_session
      expect(response).to redirect_to(carts_url)
    end
  end

end
