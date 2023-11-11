class Post < ApplicationRecord

  belongs_to :user
  belongs_to :community
  belongs_to :tag

  has_many   :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one :notice, as: :subject, dependent: :destroy

  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      Post.where("title = ? OR body = ?", word, word)
    elsif search == "forward_match"
      Post.where("title LIKE ? OR body LIKE ?", "#{word}%", "#{word}%")
    elsif search == "backward_match"
      Post.where("title LIKE ? OR body LIKE ?", "%#{word}", "%#{word}")
    elsif search == "partial_match"
      Post.where("title LIKE ? OR body LIKE ?", "%#{word}%", "%#{word}%")
    else
      Post.all
    end
  end

end
