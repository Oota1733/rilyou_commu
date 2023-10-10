class EntryUser < ApplicationRecord
  
  belongs_to :user
  belongs_to :commumity
end
