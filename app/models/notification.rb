class Notification < ApplicationRecord
  
   belongs_to :user
   scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  
  validates :name, presence: true
  validates :introduction, presence: true
end
