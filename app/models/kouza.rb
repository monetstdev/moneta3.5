class Kouza < ApplicationRecord
  belongs_to :user
  has_many :meisai

  # 金融商品種別は、普通預金か、定期預金
  enum kinyu_shohin: [:futsu_yokin, :teiki_yokin]
end
