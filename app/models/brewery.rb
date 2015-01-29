class Brewery < ActiveRecord::Base
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  include RatingAverage

  validates :year, numericality: {
                     only_integer: true,
                     greater_than_or_equal_to: 1042,
                     less_than_or_equal_to: 2015
                 }

  def restart
    self.year = 2015
    puts "changed year to #{year}"
  end

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

end
