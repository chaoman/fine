require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { create :user }
  it { is_expected.to have_secure_password }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :followers }
  it { is_expected.to have_many :following }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_uniqueness_of :username }
  it { is_expected.to validate_uniqueness_of :email }

  context 'when password validation failed' do
    let(:invalid_user) { build(:user, password: 'asd') }
    it { expect(invalid_user).not_to be_valid }
  end

  describe 'following functionality' do
    let(:second_valid_user) { create(:random_user) }
    context 'when there are no followers' do
      it { expect(valid_user.following.count).to eq(0) }
    end
    context 'when following another user' do
      before { valid_user.follow second_valid_user }
      it { expect(valid_user.following?(second_valid_user)).to be_truthy }
    end
    context 'when unfollowing another user' do
      before { valid_user.follow second_valid_user }
      before { valid_user.unfollow second_valid_user }
      it { expect(valid_user.following?(second_valid_user)).to be_falsey }
    end
    context 'when users have no common activity' do
      it { expect(valid_user.relationship_strength(second_valid_user)).to eq(nil.to_f) }
    end
    context 'when users have common activity' do
      let(:location) { build :location }
      let(:post) { create(:post, user: valid_user, location: location) }
      before { post.like_by second_valid_user }
      it { expect(valid_user.relationship_strength(second_valid_user)).to be_positive }
    end
  end
end
