class Activity < ActiveRecord::Base
  class << self
    def append(content)
      Activity.create :content => content
    end
  end
end
