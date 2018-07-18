require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create :user }
  it { is_expected.to belong_to :user }
  it { is_expected.to have_one :location }
  it { is_expected.to have_many :likes }
  it { is_expected.to validate_presence_of :description }

  describe 'liking functionality' do
    let!(:second_valid_user) { create(:user, username: 'icecube3', email: 'icecube3@gmail.com') }
    let!(:location) { build :location }
    let!(:post) { create(:post, user: user, location: location) }
    context 'when no one likes it' do
      it { expect(post.likes.count).to eq(0) }
    end
    context 'when other user starts liking it' do
      before { post.like_by user }
      it { expect(post.liked_by?(user)).to be_truthy }
    end
    context 'when other user unlikes it' do
      before { post.like_by user }
      before { post.unlike_by user }
      it { expect(post.liked_by?(user)).to be_falsey }
    end
  end
end
