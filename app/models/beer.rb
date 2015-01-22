class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
    # return self.ratings.average(:score)
    return self.ratings.inject(0.0) { | sum, rating | sum + rating.score } / self.ratings.count
  end

  def to_s
    return "#{self.name}, #{self.brewery.name}"
  end
end
