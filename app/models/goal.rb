class Goal < ApplicationRecord

    validates :title, :details, :user_id, presence: true
    validates :private, inclusion: { in: [true, false] }, default: false
    validates :completed, inclusion: { in: [true, false] }, default: false
    belongs_to :user
    has_many :goal_comments

end
