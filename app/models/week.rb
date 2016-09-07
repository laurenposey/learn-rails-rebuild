class Week < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  def previous
    self.course.weeks.where("weeks.id < ?", self.id).order('created_at asc').last
  end
end
