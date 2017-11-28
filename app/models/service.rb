# == Schema Information
#
# Table name: services
#
#  id               :integer          not null, primary key
#  name             :string
#  url              :string
#  is_up            :boolean          default(FALSE)
#  xpath            :text
#  expected_content :string
#

class Service < ApplicationRecord

  has_many :pings

  validates :name, :url, presence: true

  def update_status
    currently_up = check_status
    pings.create(is_up: currently_up)

    if currently_up != is_up
      update(is_up: currently_up)
      ServiceMailer.send_notification(self).deliver_now
    end
  end

  private

  def check_status
    response = HTTP.get(url)

    # We consider the website unavailable unless we receive a success/redirect status code
    return false unless (200..399).include?(response.code)
    return true unless xpath && expected_content

    doc = Nokogiri::HTML(response.body.to_s)
    return doc.xpath(xpath).first.try(:content) == expected_content
  end
end
