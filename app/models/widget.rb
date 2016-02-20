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

  has_many :reviews, -> { order(created_at: :desc) }
  has_one :photo
  has_one :text
  has_one :swidget
  has_many :menu

  def short_url
    if self.widget_klass=="review"
      "/restaurants/"+self.restaurant.id.to_s+"/s/reviews"
    elsif self.widget_klass=="menu"
      "/restaurants/"+self.restaurant.id.to_s+"/s/menu"
    elsif self.widget_klass=="text"
      "/restaurants/"+self.restaurant.id.to_s+"/s/text/"+self.text.id.to_s
    elsif self.widget_klass=="swidget"
      "/restaurants/"+self.restaurant.id.to_s+"/s/static/"+self.swidget.id.to_s
    end
  end

  def long_url
    if self.widget_klass=="review"
      "/restaurants/"+self.restaurant.id.to_s+"/b/reviews"
    elsif self.widget_klass=="menu"
      "/restaurants/"+self.restaurant.id.to_s+"/b/menu"
    elsif self.widget_klass=="text"
      "/restaurants/"+self.restaurant.id.to_s+"/b/text/"+self.text.id.to_s
    elsif self.widget_klass=="swidget"
      "/restaurants/"+self.restaurant.id.to_s+"/b/static/"+self.swidget.id.to_s
    end

  end
end
