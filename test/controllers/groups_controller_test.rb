require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest
  describe 'GET #index' do
    subject { get :index }

    # This may work...
    it { should have_http_status(:success) }
    # ...but this will not!
    it { should permit(:name, :icon).for(:post) }
  # test "the truth" do
  #   assert true
  # end
end
