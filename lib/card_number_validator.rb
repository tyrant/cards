module CardNumberValidator

  def self.valid?(number)
    return false unless self.numeric_string?(number)
    
    alternate_doubled_digits = []

    number.chars.reverse.each_with_index.map do |digit, i|
      (i+1)%2==0 ? (digit.to_i*2).to_s : digit

    end.reverse.each do |digit|
      if digit.length > 1
        alternate_doubled_digits << digit[0]
        alternate_doubled_digits << digit[1]
      else
        alternate_doubled_digits << digit
      end
    end

    alternate_doubled_digits.map(&:to_i).sum % 10 == 0
  end

  def self.numeric_string?(str)
    str.scan(/\D/).empty?
  end
end
