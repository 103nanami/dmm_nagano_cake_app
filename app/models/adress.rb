class Adress < ApplicationRecord

  belongs_to :customer

  def full_adress
    '〒' + postal_code + ' ' + adress + ' ' + name
  end

end
