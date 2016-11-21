require 'rails_helper'

RSpec.describe Calc, type: :model do
  it 'must sum two numbers' do
    result = Calc.new.sum 1, 2
    expect(result).to eq(3)
  end
end
