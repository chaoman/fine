require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create :user }
  let!(:jwt) { Auth.issue user: user.id }
  before { request.env['HTTP_AUTHORIZATION'] = 'Bearer ' << jwt }

  describe '#authenticate' do
    it { expect(subject.logged_in?).to be_truthy }
  end
end
