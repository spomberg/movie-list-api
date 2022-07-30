require 'rails_helper'
require './app/helpers/list_helper'

RSpec.configure do |c|
  c.include ListHelper
end

RSpec.describe List, type: :model do
  context "with a valid movie id" do
    xit "returns true" do
      output = is_movie_id_valid(500)
      expect(output).to eq true
    end
  end

  context "with an invalid movie id" do
    xit "returns false" do
      output = is_movie_id_valid(95518)
      expect(output).to eq false
    end
  end

  context "with a valid adult movie id" do
    xit "returns false" do
      output = is_movie_id_valid(177637)
      expect(output).to eq false
    end
  end

  context "with a valid index and array" do
    it "moves the element up" do
      mock_arr = [1, 2, 3, 4, 5]
      output = move_up(mock_arr, 2)
      expected_result = [1, 3, 2, 4, 5]

      expect(output).to eq expected_result
    end
  end

end
