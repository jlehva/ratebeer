class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships

  validates :username, uniqueness: true
  validates :username, length: {
                         minimum: 3,
                         maximum: 15
                     }
  validates :password, length: {
                         minimum: 4
                     }
  validates_format_of :password, with: /(?=.*[\d])/, message: "password must contain at least one digit"
  validates_format_of :password, with: /(?=.*[A-ZÅÄÖ])/, message: "password must contain at least one upper case letter"

end
