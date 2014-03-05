class Friend < ActiveRecord::Base
  validates :name, presence: true

  has_attached_file :avatar
  has_attached_file :data_file

  validates_attachment :avatar, presence: true, content_type: {content_type: /\Aimage\/.*\Z/}
end
