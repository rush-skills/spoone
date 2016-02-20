# == Schema Information
#
# Table name: swidgets
#
#  id         :integer          not null, primary key
#  name       :string
#  widget_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_swidgets_on_widget_id  (widget_id)
#
# Foreign Keys
#
#  fk_rails_8be2cc0deb  (widget_id => widgets.id)
#

class Swidget < ActiveRecord::Base
  belongs_to :widget

  def self.names
    ["music","uber","quiz"]
  end
end
