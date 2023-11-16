class Notification < ApplicationRecord
  
   belongs_to :user
   #belongs_to :subject, polymorphic: true
   scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  
  validates :name, presence: true
  validates :introduction, presence: true
  
  enum action_type: { commented_to_own_post: 0, favorite_to_own_post: 1}
end
