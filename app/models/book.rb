class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }
  
  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end
end
