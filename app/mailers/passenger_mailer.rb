class PassengerMailer < ApplicationMailer
  default from: 'flight_booker@example.com'

  def thank_you_email(passenger)
    @url = 'placeholder'

    @passenger = passenger
    @booking = passenger.booking
    @flight = @booking.flight

    email_with_name = %("#{passenger.name}" <#{passenger.email}>)

    mail(to: email_with_name,
         subject: "Confirmation of booking ##{@booking.id}.")
  end
    
end
