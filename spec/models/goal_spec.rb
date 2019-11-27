require 'rails_helper'

RSpec.describe Goal, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:details) }
  it { should validate_inclusion_of(:private).in_array([true, false]) }
  it { should validate_inclusion_of(:completed).in_array([true, false]) }

end
