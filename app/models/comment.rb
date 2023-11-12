class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  has_one :notice, as: :subject, dependent: :destroy

  after_create_commit :create_notices

  private
    def create_notices
      Notice.create(subject: self, user: post.user, action_type: :commented_to_own_post)
    end

end
