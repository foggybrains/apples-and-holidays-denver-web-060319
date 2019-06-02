require 'pry'

holiday_hash = {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
       :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_hash = holiday_hash[:winter]
  winter_supplies = ""
  winter_hash.each do |key, value|
    winter_supplies += "#{value}"
  end
  winter_supplies
end

##############################################################
def season_to_sting(season_symbol)
  master = ""
  master += season_symbol.to_s
  master.capitalize
end

def holiday_to_sting(holiday_symbol)
  master = ""
  master2 = []
  master += holiday_symbol.to_s
  master = master.split('_')
  master.each do |word|
    master2 << word.capitalize
  end
  master2 = master2.join(' ')
end

def array_to_sting(array)
  master = []
  array.each do |supply|
    master << supply.to_s
  end
  master.join(", ")
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  master_string = ""
  holiday_hash.each do |season, holi_hash|
    master_string += season_to_sting(season)
    master_string += ":\n"
    holi_hash.each do |holiday, supply|
      master_string += "  " #tab?
      master_string += holiday_to_sting(holiday)
      master_string += ": "
      master_string += array_to_sting(supply)
      master_string += "\n"
    end
  end
  puts master_string
end

###################################################################

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []
  holiday_hash.each do |season, hash2|
    hash2.each do |holiday, supply|
      if supply.include?("BBQ")
        bbq_days << holiday
      end
    end
  end
  bbq_days
end







