# == Schema Information
#
# Table name: services
#
#  id    :integer          not null, primary key
#  name  :string
#  url   :string
#  is_up :boolean          default(FALSE)
#

class Service < ApplicationRecord

  has_many :pings
end
