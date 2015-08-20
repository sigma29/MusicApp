class Album < ActiveRecord::Base
  validates :name, :band_id, presence: true

  belongs_to :band
end
