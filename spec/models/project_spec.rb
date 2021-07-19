require 'rails_helper'

describe 'Project', type: :feature do
   describe 'Create new Project' do
      it 'should not be valid without name' do
         u = Project.new(amount: 5)
         expect(u.valid?).to be(false)
      end
      it 'should not be valid without amount' do
        u = Project.new(name: "moriuks")
        expect(u.valid?).to be(false)
     end
     it 'should be valid' do
        u = Project.new(name: "moriuks",amount: 8,author_id:1)
        expect(u.valid?).to be(true)
     end
     
  end
end
