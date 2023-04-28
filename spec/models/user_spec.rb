require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Birhanu Gudisa', email: 'birhanu@gudisa.com', password: 'testing12') }
  before { subject.save }
  context 'Testing validation for User is valid and saved' do
    it 'User should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be valid' do
      subject.name
      expect(subject).to be_valid
    end

    it 'Email should be valid' do
      subject.email
      expect(subject).to be_valid
    end
  end

  context 'Testing associations' do
    it 'User can have many catgories' do
      u = User.reflect_on_association(:groups)
      expect(u.macro).to eq(:has_many)
    end

    it 'User can have many costs or expenses' do
      u = User.reflect_on_association(:costs)
      expect(u.macro).to eq(:has_many)
    end
  end
end
