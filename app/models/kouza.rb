class Kouza < ApplicationRecord
  belongs_to :bank
  belongs_to :shiten
  belongs_to :user
  has_many :meisai

  enum kinyu_shohin: [:futsu_yokin, :teiki_yokin]
end
