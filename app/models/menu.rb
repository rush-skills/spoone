# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  widget_id  :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_menus_on_widget_id  (widget_id)
#
# Foreign Keys
#
#  fk_rails_2756af2c1b  (widget_id => widgets.id)
#

class Menu < ActiveRecord::Base
  belongs_to :widget

  mount_uploader :image, ImageUploader
end
