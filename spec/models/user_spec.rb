require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it {should have_one(:route)}
    it {should have_one(:contact)}
  end
end
