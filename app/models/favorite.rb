class Favorite < ApplicationRecord
  
  belongs_to :post
  belongs_to :user
  

  has_one :notice, as: :subject, dependent: :destroy

  after_create_commit :create_notices

  private
  def create_notifications
    Notice.create(subject: self, user: self.post.user, action_type: :liked_to_own_post)
  end
end

