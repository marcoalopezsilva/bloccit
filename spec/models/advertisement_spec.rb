require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:advertisement) {Advertisement.create!(title:"Advertisement for Pepsi", copy:"Pepsi now on sale!", price: 3)}
  describe "attributes" do
      it "has title, copy and price attributes" do
          expect(advertisement).to have_attributes(title:"Advertisement for Pepsi", copy:"Pepsi now on sale!", price: 3)
      end
  end
end
