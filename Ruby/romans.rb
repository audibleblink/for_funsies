ROMAN_NUMERAL_MAP = {
  "M" => 1000,
  "D" => 500,
  "C" => 100,
  "L" => 50,
  "X" => 10,
  "V" => 5,
  "I" => 1
}

NEW_SCHOOL_MAP = {
  "DCCCC" => "CM", #900
  "CCCC"  => "CD", #400
  "LXXXX" => "XC", #90
  "XXXX"  => "XL", #40
  "VIIII" => "IX", # 9
  "IIII"  => "IV"  # 4
}

def calculate_roman(input) 
  result = ""
  ROMAN_NUMERAL_MAP.each do |roman, number|
    divisor, remainder = input.divmod(number)
    result += (roman * divisor)
    input = remainder
  end
  result
end

def convert_to_new_school(gross_roman)
  NEW_SCHOOL_MAP.each do |gross_number, clean_number|
    gross_roman.gsub!(gross_number, clean_number)
  end
  gross_roman
end

gross = calculate_roman 949
p convert_to_new_school gross
