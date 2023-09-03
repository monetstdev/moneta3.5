class Meisai < ApplicationRecord
  belongs_to :kouza

  # 取引区分は、入金または出金
  enum kubun: [:nyuukin, :syukkin]
end
