require 'rails_helper'

RSpec.describe Cost, type: :model do
  subject do
    User.create(name: 'Birhanu Gudisa', email: 'birhanu@gudisa.com', password: 'testing12')
  end

  before(:each) do
    @cost = Cost.new(name: 'Food', amount: 100, author_id: subject.id)
  end

  context 'Validation' do
    it 'Should be valid' do
      expect(@cost).to be_valid
    end

    it 'Cost should have a name' do
      @cost.name = nil
      expect(@cost).to_not be_valid
    end

    it 'Cost should have an amount' do
      @cost.amount = nil
      expect(@cost).to_not be_valid
    end

    it 'Cost should have a author' do
      @cost.author_id = nil
      expect(@cost).to_not be_valid
    end
  end

  context 'Testing associations' do
    it 'Cost belong to an author' do
      subject = Cost.reflect_on_association(:author)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'Cost should have many group cost' do
      subject = Cost.reflect_on_association(:group_costs)
      expect(subject.macro).to eq(:has_many)
    end

    it 'Cost should have many Group' do
      subject = Cost.reflect_on_association(:groups)
      expect(subject.macro).to eq(:has_many)
    end
  end
end
