require 'test_helper'

class ServiceTest < ActiveSupport::TestCase

  test 'update_status up no xpath' do
    service = services(:no_xpath)

    stub_request(:any, service.url)

    service.update_status
    assert service.is_up
  end

  test 'update_status down no xpath' do
    service = services(:no_xpath)

    stub_request(:any, service.url).to_return(status: 500)

    service.update_status
    assert !service.is_up
  end


end
