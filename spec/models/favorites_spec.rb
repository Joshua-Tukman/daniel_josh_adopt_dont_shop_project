require 'rails_helper'

RSpec.describe Favorites, type: :model do

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      favorites = Favorites.new({1 => 3, 2 => 1})

      expect(favorites.total_count).to eq(2)
    end
  end
end
