class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snack, through: :machine_snacks

  def average_snack_price
    snack.average(:price)
  end
end
