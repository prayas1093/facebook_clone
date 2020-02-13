class ServicesController < ApplicationController

  def call(phnNumber)
    otp=generate_otp
    client = Twilio::REST::Client.new
    client.messages.create({
                             from: ENV['twilio_phone_number'],
                             to: phnNumber,
                             body: otp
                           })
  end


  private

  def generate_otp

  end

end
