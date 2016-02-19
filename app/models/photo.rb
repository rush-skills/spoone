# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  widget_id  :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_photos_on_widget_id  (widget_id)
#
# Foreign Keys
#
#  fk_rails_cf2e3ae67b  (widget_id => widgets.id)
#

class Photo < ActiveRecord::Base
  belongs_to :widget

  mount_uploader :image, ImageUploader
end
