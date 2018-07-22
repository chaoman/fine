require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create :user }
  before { request.env['HTTP_AUTHORIZATION'] = 'Bearer ' << user.auth_token }

  describe '#authenticate' do
    context 'when gets Bearer JWT token and logs user in' do
      it { expect(subject.logged_in?).to be_truthy }
    end
    context 'when logged in and does not respond_with_error' do
      it { expect(subject.authenticate).to be_nil }
    end
  end
end
