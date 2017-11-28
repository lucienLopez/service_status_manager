# == Schema Information
#
# Table name: pings
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ping < ApplicationRecord
end
