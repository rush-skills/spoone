require "administrate/base_dashboard"

class RestaurantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    widgets: Field::HasMany,
    reviews: Field::HasMany,
    menu: Field::HasMany,
    text: Field::HasMany,
    photo: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    image: Field::String,
    address: Field::String,
    lat: Field::String,
    lng: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :widgets,
    :reviews,
    :menu,
    :text,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :widgets,
    :reviews,
    :menu,
    :text,
    :photo,
    :id,
    :name,
    :image,
    :address,
    :lat,
    :lng,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :widgets,
    :reviews,
    :menu,
    :text,
    :photo,
    :name,
    :image,
    :address,
    :lat,
    :lng,
  ]

  # Overwrite this method to customize how restaurants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(restaurant)
  #   "Restaurant ##{restaurant.id}"
  # end
end
