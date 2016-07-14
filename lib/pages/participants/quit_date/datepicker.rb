# frozen_string_literal: true
# object for datepicking methods
class DatePicker
  include Capybara::DSL

  def select_day(date)
    day = Date.parse(date)
    date_number = day.mday
    if date_number.between?(1, 9)
      day_less_than_10(date_number)
    elsif date_number.between?(30, 31) ||
          date_number >= 23 && page.has_text?(date_number, count: 2)
      day_greater_than_23(date_number)
    else
      find('.text-right.ng-binding.ng-scope', text: date_number).click
    end
  end

  private

  # Find the first day with today's date's number
  def first_day(date_number)
    first('.text-right.ng-binding.ng-scope', text: date_number)
  end

  # Day is either 1 - 9
  def day_less_than_10(date_number)
    if date_number == 1
      unusual_day_1(date_number)
    elsif date_number == 2
      unusual_day_2(date_number)
    elsif date_number == 3
      unusual_day_3(date_number)
    elsif date_number.between?(4, 9) && has_text?("2#{date_number}", count: 2)
      calendar_date(date_number, 1)
    else
      first_day(date_number).click
    end
  end

  # Day is 23 or greater
  def day_greater_than_23(date_number)
    if date_number >= 23 && has_text?(date_number, count: 2)
      calendar_date(date_number, 1)
    else
      first_day(date_number).click
    end
  end

  # Transform first date with today's date's number into an integer
  def wrong_date_integer(date_number)
    first_day(date_number).text.to_i
  end

  # Day is the 1st
  def unusual_day_1(date_number)
    date_integer = wrong_date_integer(date_number)
    if date_integer == 1
      first_day(date_number).click
    elsif date_integer == 31
      calendar_date(date_number, 1)
    end
  end

  # Day is the 2nd
  def unusual_day_2(date_number)
    if has_no_text?('29', count: 2)
      february(date_number)
    else
      not_february(date_number)
    end
  end

  # Day is the 3rd
  def unusual_day_3(date_number)
    date_integer = wrong_date_integer(date_number)
    if date_integer == 3
      first_day(date_number).click
    elsif date_integer == 30
      wrong_day_30(date_number)
    elsif date_integer == 31
      calendar_date(date_number, 1)
    elsif date_integer == 23
      unusual_day_4(date_number)
    end
  end

  # Day is the 3rd and the first choice is the 30th
  def wrong_day_30(date_number)
    if two_30_one_31_last(date_number)
      calendar_date(date_number, 1)
    elsif two_30_one_31_not_last(date_number) || two_30_two_31
      calendar_date(date_number, 2)
    end
  end

  # Find the last day with today's date's date_numberber
  def last_date_text(date_number)
    last_date = all('.text-right.ng-binding.ng-scope', text: date_number).last
    last_date.text
  end

  # Day is the 3rd, and it's March
  def one_30_last(date_number)
    has_no_text?('30', count: 2) && last_date_text(date_number).to_i == 30
  end

  # Day is the 3rd, and it's January
  def one_30_not_last(date_number)
    has_no_text?('30', count: 2) && last_date_text(date_number).to_i != 30
  end

  # Day is the 3rd, first choice is the 30th, second choice is not the 31st
  def two_30_one_31_last(date_number)
    has_text?('30', count: 2) && has_text?('31', count: 1) &&
      last_date_text(date_number).to_i == 31
  end

  # Day is the 3rd, first choice is the 30th, second choice is the 31st
  def two_30_one_31_not_last(date_number)
    has_text?('30', count: 2) && has_text?('31', count: 1) &&
      last_date_text(date_number).to_i != 31
  end

  # Day is the 3rd, first choice is the 30th, second choice is the 31st
  def two_30_two_31
    has_text?('30', count: 2) && has_text?('31', count: 2)
  end

  # Day is the 3rd, first choice is the 23rd
  def unusual_day_4(date_number)
    if one_30_last(date_number)
      calendar_date(date_number, 1)
    elsif one_30_not_last(date_number) || two_30_one_31_last(date_number)
      calendar_date(date_number, 2)
    elsif two_30_one_31_not_last(date_number) || two_30_two_31
      calendar_date(date_number, 3)
    end
  end

  # Day is the 2nd, the previous month is February on a non-leap year
  def february(date_number)
    date_integer = wrong_date_integer(date_number)
    if date_integer.between?(23, 28)
      wrong_date_replacements = { 23 => 6, 24 => 5, 25 => 4, 26 => 3,
                                  27 => 2, 28 => 1 }
      calendar_date(date_number, wrong_date_replacements[date_integer])
    else
      first_day(date_number).click
    end
  end

  # Day is the 2nd, and the month and the previous month is not February
  # OR Day is the 2nd, and any month in a leap year
  def not_february(date_number)
    date_integer = wrong_date_integer(date_number)
    if date_integer.between?(23, 29)
      wrong_date_replacements = { 23 => 7, 24 => 6, 25 => 5, 26 => 4, 27 => 3,
                                  28 => 2, 29 => 1 }
      calendar_date(date_number, wrong_date_replacements[date_integer])
    else
      first_day(date_number).click
    end
  end

  # select the date
  def calendar_date(date_number, selector_id)
    selection = all('.text-right.ng-binding.ng-scope',
                    text: date_number)[selector_id]
    selection.click
  end
end
