#!/usr/bin/env ruby
require "rubygems"
require "bundler/setup"
require "mailman"
Mailman.config.poll_interval = 3
Mailman.config.pop3 = {
  server: 'pop.gmail.com', port: 995, ssl: true,
  username: "rails.test.emailid@gmail.com",
  password: "railstest"
}
  Mailman::Application.run do
  default do
    begin
    p "Found a new message"
   Ticket.receive_mail(message)
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("\n")
    end
  end
end
