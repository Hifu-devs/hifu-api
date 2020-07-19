class User < ApplicationRecord
  has_one :route, dependent: :destroy
  has_one :contact, dependent: :destroy

end
