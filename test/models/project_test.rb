require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context 'associations' do
    should belong_to(:user).class_name('User')
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name).scoped_to(:project_id)
  end
end
