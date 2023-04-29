require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    User.create(name: 'Birhanu Gudisa', email: 'birhanu@gudisa.com', password: 'testing12')
  end

  before(:each) do
    @group = Group.new(name: 'Food',
                       icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW5Ck-iC01eb-okOD0QQaOVMKIGWw4X2ExAP99iYewkuOX1Ea13sHi-00o2LVBhrPHx3I&usqp=CAU',
                       author_id: subject.id)
  end

  context 'Validit test' do
    it 'It should be valid' do
      expect(@group).to be_valid
    end

    it 'group should have name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'Group should have an icon' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end

    it 'Group should have a author' do
      @group.author_id = nil
      expect(@group).to_not be_valid
    end
  end

  context 'Testing associations' do
    it 'Group should belong to author' do
      subject = Group.reflect_on_association(:author)
      expect(subject.macro).to eq(:belongs_to)
    end
  end
end
