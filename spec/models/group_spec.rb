require 'rails_helper'

describe 'Group', type: :feature do
  describe 'Create new Group' do
    it 'should not be valid without icon' do
      u = Group.new(name: 'rspec')
      expect(u.valid?).to be(false)
    end
  end
end
