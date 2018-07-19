require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }

  context 'When creating a new comment' do
    let(:user) { create :user }
    let(:post) { create(:post, location: (build :location), user: user) }
    let(:comment) { post.comments.new(message: 'Example message', user_id: user.id) }
    before { comment.save }
    it { expect(post.comments.count).to be_positive }
  end
end
