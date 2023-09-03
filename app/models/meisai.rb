class Meisai < ApplicationRecord
  belongs_to :kouza

  enum kubun: [:nyuukin, :syukkin]
end
