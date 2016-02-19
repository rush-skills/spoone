# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  widget_id  :integer
#  user_id    :integer
#  text       :string
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reviews_on_user_id    (user_id)
#  index_reviews_on_widget_id  (widget_id)
#
# Foreign Keys
#
#  fk_rails_74a66bd6c5  (user_id => users.id)
#  fk_rails_d83d9fab54  (widget_id => widgets.id)
#

class Review < ActiveRecord::Base
  belongs_to :widget
  belongs_to :user

  def to_s
    text
  end

  def name
    to_s
  end
end
