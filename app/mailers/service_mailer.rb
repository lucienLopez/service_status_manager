class ServiceMailer < ApplicationMailer

  default from: ENV['EMAIL_FROM']

  def send_notification(service)
    mail(
        to: ENV['EMAIL_TO'],
        body: "Your service #{service.name} (#{service.url}) is #{service.is_up ? 'up' : 'down'}",
        content_type: 'text/plain',
        subject: "#{service.name} status update"
    )
  end
end
