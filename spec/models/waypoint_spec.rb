require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe 'relationships' do
    it {should belong_to(:route)}
    it {should have_one(:next)}

    it {should belong_to(:previous).optional(true)}
  end
end
