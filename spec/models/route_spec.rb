require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should have_many(:waypoints)}
    it {should have_one(:contact).through(:user)}
  end
end
