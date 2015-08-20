class Album < ActiveRecord::Base
  RECORDING_TYPES = %w(live studio)

  validates :name, :band_id, :recording_type, presence: true
  validates :recording_type,
    inclusion: { in: RECORDING_TYPES, msg:"Invalid recording type"}

  belongs_to :band

  has_many :tracks,
    dependent: :destroy

end
