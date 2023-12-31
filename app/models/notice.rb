class Notice < ApplicationRecord

  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_post: 0, favorite_to_own_post: 1 }
end
