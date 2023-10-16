class Tag < ApplicationRecord
  
  has_many :post, dependent: :destroy

   validates :name, presence: true, length: { minimum: 1 }
end
