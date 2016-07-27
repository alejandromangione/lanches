class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items
  has_and_belongs_to_many :labels

  scope :by_date, -> (date) { where('created_at >= ?', date.to_datetime ) }

end
