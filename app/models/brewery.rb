class Brewery < ActiveRecord::Base
  has_many :beers

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
