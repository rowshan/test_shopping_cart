require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe 'factory' do
    it 'exists' do
      expect { FactoryGirl.create :cart }.not_to raise_error
    end

    it 'is valid' do
      expect(build :cart).to be_valid
    end

    it 'has the attributes' do
      expect(attributes_for(:cart)).to include(:product_name,:category)
    end
  end

  describe "validation of" do

    context 'product_name' do
      subject { build(:cart, product_name: nil) }
      it " fails for missing" do
        expect(subject).not_to be_valid
        expect(subject.errors).to include(:product_name)
      end
    end

  end

end
