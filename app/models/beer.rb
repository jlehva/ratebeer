class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  validates :name, presence: true, allow_blank: false

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end
end
