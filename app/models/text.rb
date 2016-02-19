# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  widget_id  :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_texts_on_widget_id  (widget_id)
#
# Foreign Keys
#
#  fk_rails_cbb668f699  (widget_id => widgets.id)
#

class Text < ActiveRecord::Base
  belongs_to :widget

  def to_s
    text
  end

  def title
    to_s
  end
end
