class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true
  validates :postscounter, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # A method that returns the last 3 posts of a user using associations

  def last_posts
    posts.order(created_at: :desc).limit(3)
  end
end
