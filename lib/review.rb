class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def self.percentage(no,total)
  	no / total * 100.0
  end
  def self.average(5star,4star,3star,2star,1star)
  	total = 5star+4star+3star+2star+1star
  	((5star*5 )+ (4star*4) + (3star*3) + (2star*2) + (1star*1))/total
  end
end
