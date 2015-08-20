class Track < ActiveRecord::Base
  TRACK_TYPES =%w(regular bonus)
  validates :album_id, :title, :track_type, presence: true
  validates :track_type,
    inclusion: { in: TRACK_TYPES, msg:"Invalid track type" }

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

  has_many :notes
end
