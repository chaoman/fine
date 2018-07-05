require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_one :location }
  it { is_expected.to validate_presence_of :description }
end
