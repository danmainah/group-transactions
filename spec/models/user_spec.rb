require 'rails_helper'

describe 'User', type: :feature do
  describe 'Create new User' do
    it 'should not be valid without name' do
      u = User.new
      expect(u.valid?).to be(false)
    end

    it 'should be valid' do
      u = User.new(username: 'daniella')
      expect(u.valid?).to be(true)
    end
  end
end
