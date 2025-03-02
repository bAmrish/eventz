module EventsHelper
  def price(event)
    if event.free?
      "Free"
    else
      number_to_currency(event.price, precision: 0, unit: "USD ")
    end
  end

  def date_and_time(event)
    event.starts_at.strftime("%B %e, %Y %I:%M %P")
  end
end
