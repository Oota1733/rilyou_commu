class Post < ApplicationRecord

  belongs_to :user
  belongs_to :community

  has_many   :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

   def self.looks(search, word)
    if search == "perfect_match"
      Post.where("body = ?", word)
    elsif search == "forward_match"
      Post.where("body LIKE ?","#{word}%")
    elsif search == "backward_match"
      Post.where("body LIKE ?","%#{word}")
    elsif search == "partial_match"
      Post.where("body LIKE ?","%#{word}%")
    else
      Post.all
    end
   end

end
