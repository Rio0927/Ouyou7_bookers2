class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  scope :latest, -> {order(created_at: :desc)}
  scope :star_count, -> {order(star: :desc)}
  
  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end
end
