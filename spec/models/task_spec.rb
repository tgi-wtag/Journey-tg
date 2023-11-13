require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it do
      should define_enum_for(:status)
        .with_values(todo: 0, in_progress: 1, finished: 2)
        .backed_by_column_of_type(:integer)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
