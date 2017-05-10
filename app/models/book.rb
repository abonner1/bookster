class Book < ActiveRecord::Base
  belongs_to :user

  validates :title, :author, :price, :availability, presence: true
end
