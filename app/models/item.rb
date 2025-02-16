#  id: nil,
#  order_id: nil,
#  title: nil,
#  amount: nil,
#  type: nil,
#  created_at: nil,
#  updated_at: nil


class Item < ApplicationRecord
  belongs_to :order

  acts_as_paranoid
  has_paper_trail
end
