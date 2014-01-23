Time::DATE_FORMATS[:car_slot] = lambda { |time|
  time.strftime("%m/%d")
}
