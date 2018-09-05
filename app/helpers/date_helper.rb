# frozen_string_literal: true

module DateHelper
  def formatted_date(time_with_zone)
    time_with_zone.strftime("%d/%m/%Y %H:%M")
  end
end
