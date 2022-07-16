require 'rails_helper'
require './app/helpers/list_helper'

RSpec.configure do |c|
  c.include ListHelper
end

RSpec.describe List, type: :model do
  context "with a valid movie id" do
    it "returns true" do
      output = is_movie_id_valid(500)
      expect(output).to eq true
    end
  end
end
