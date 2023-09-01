class Kouza < ApplicationRecord
  belongs_to :bank
  belongs_to :shiten
  belongs_to :user
end
