
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>", tiny: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user
  has_many :likes
  validates :username, presence: true, uniqueness: true

  def likes?(tweet) #likes? is the name of our method. tweet is the argument.
    tweet.likes.where(user_id: id).any? #Look for the user.id, any? makes the method return true or false.
  end
end
