require "administrate/base_dashboard"

class WidgetDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    restaurant: Field::BelongsTo,
    reviews: Field::HasMany,
    photo: Field::HasMany,
    text: Field::HasMany,
    menu: Field::HasMany,
    id: Field::Number,
    half: Field::Boolean,
    position: Field::Number,
    widget_klass: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :restaurant,
    :reviews,
    :photo,
    :text,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :restaurant,
    :reviews,
    :photo,
    :text,
    :menu,
    :id,
    :half,
    :position,
    :widget_klass,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :restaurant,
    :reviews,
    :photo,
    :text,
    :menu,
    :half,
    :position,
    :widget_klass,
  ]

  # Overwrite this method to customize how widgets are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(widget)
  #   "Widget ##{widget.id}"
  # end
end
