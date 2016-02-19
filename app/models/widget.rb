# == Schema Information
#
# Table name: widgets
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  half          :boolean
#  position      :integer
#  widget_klass  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_widgets_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_9c335d1e78  (restaurant_id => restaurants.id)
#

class Widget < ActiveRecord::Base
  belongs_to :restaurant
  acts_as_list scope: :restaurant

  has_many :reviews
  has_many :photo
  has_many :text
  has_many :menu
end
