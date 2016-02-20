# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  image      :string
#  address    :string
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_many :widgets, -> { order(position: :asc) }
  has_many :reviews, through: :widgets
  has_many :menus, through: :widgets
  has_many :texts, through: :widgets

  mount_uploader :image, ImageUploader

  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  validates_presence_of :name, :image

  before_validation :geocode_address, :on => :create

  before_save :prepare_bs
  after_create :setup_widgets

  def prepare_bs
    self.address = self.address.upcase
  end

  def setup_widgets
    Widget.create(restaurant: self, half: false, widget_klass: "review")
    Widget.create(restaurant: self, half: false, widget_klass: "menu")
  end

  def menu_widget
    self.widgets.where(widget_klass: "menu").first
  end

  def review_widget
    self.widgets.where(widget_klass: "review").first
  end

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
