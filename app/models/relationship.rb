class Relationship < ApplicationRecord
  # belongs_to :user
  
  # class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  validates :follower_id, presence: true
  validates :followee_id, presence: true
end
