class Community < ApplicationRecord

  has_many :entry_users, dependent: :destroy
  belongs_to :user, class_name: 'User'
  has_many :users, through: :entry_users
  has_many :posts

  validates :name, presence: true
  validates :introduction, presence: true


  def is_owned_by?(user)
    owner.id == user.id
  end

end
