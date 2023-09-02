class Book < ApplicationRecord 
	belongs_to :user
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end
  
  def self.dec_favo_a_week
    includes(:favorites).sort_by{
      |x|
      x.favorites.where(created_at: 1.week.ago..Time.now).count
    }.reverse
  end  
end
