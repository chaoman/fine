require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) { @user1 = create :user }
  it { is_expected.to have_secure_password }
  it { is_expected.to have_many :posts }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_uniqueness_of :username }
  it { is_expected.to validate_uniqueness_of :email }

  before { @user2 = build(:user, password: 'asd') }
  context 'when password validation failed' do
    it { expect(@user2).not_to be_valid }
  end
end
