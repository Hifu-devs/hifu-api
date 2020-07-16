class User < ApplicationRecord
  has_one :route
  has_one :contact

end
