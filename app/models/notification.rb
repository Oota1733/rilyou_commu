class Notification < ApplicationRecord
  
   belongs_to :user
  
  validates :name, presence: true
  validates :introduction, presence: true
end
