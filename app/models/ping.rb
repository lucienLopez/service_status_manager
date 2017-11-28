# == Schema Information
#
# Table name: pings
#
#  id         :integer          not null, primary key
#  is_up      :string
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ping < ApplicationRecord

  belongs_to :service
end
