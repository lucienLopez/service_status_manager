services = [
    {
        name: 'lithium',
        url: 'http://status.lithium.com/',
        xpath: "//span[contains(@class, 'status') and contains(@class, 'font-large')]",
        expected_content: "\n            All Systems Operational\n          ",
    }
]

services.each { |service| Service.create(service)}