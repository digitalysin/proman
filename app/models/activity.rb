class Activity < ActiveRecord::Base
  scope :today, where("created_at >= ?", Date.today).order('created_at desc')
  scope :yesterday, where("created_at > ? and created_at < ?", Date.today - 1, Date.today).order('created_at desc')
  class << self
    def append(content)
      Activity.create :content => content
    end
  end
end
