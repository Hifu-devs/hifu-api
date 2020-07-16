require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe 'relationships' do
    it {should belong_to(:route)}
  end
end
