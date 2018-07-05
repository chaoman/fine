require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to :post }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_presence_of :lat }
  it { is_expected.to validate_presence_of :lng }
  it { is_expected.to validate_numericality_of :lat }
  it { is_expected.to validate_numericality_of :lng }
end
