require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it {should have_one(:route).dependent(:destroy)}
    it {should have_one(:contact).dependent(:destroy)}
  end
end
