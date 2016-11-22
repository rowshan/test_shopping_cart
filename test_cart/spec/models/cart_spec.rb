require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe 'factory' do
    it 'exists' do
      expect { FactoryGirl.build :cart }.not_to raise_error
    end

    it 'is valid' do
      expect(build :cart).to be_valid
    end

    it 'has the attributes' do
      expect(attributes_for(:cart)).to include(:product_name, :category)
    end
  end

  describe "validation of" do

    context 'product' do
      subject { build(:cart, product_name: nil) }
      it " fails for missing" do
        expect(subject).not_to be_valid
        expect(subject.errors).to include(:cart)
      end
    end

  end

end
