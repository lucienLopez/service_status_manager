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

  validates :name, :url, presence: true

  def update_status
    currently_up = check_status
    pings.create(is_up: currently_up)
    update(is_up: currently_up) if currently_up != is_up
  end

  private

  def check_status
    # TODO search inside page for content

    # We consider the website unavailable unless we receive a success/redirect status code
    return false unless (200..399).include?(HTTP.get(url).code)
  end
end
