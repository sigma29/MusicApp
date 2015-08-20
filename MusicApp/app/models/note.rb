class Note < ActiveRecord::Base
  validates :user_id, :track_id, :note_text, presence: true

  belongs_to :user

  belongs_to :track
end
