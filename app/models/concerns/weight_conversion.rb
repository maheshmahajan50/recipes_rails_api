module WeightConversion
  def convert_to_kilogram(amount, unit)
    case unit
    when "kilogram"
      amount
    when "cup"
      amount * 0.24
    when "teaspoons"
      amount * 0.0049
    when "gram"
      amount * 0.001
    end
  end

  def convert_to_gram(amount, unit)
    case unit
    when "kilogram"
      amount * 1000
    when "cup"
      amount * 128
    when "teaspoons"
      amount * 4.2
    when "gram"
      amount
    end
  end

  def convert_to_cup(amount, unit)
    case unit
    when "kilogram"
      amount * 4.2267
    when "cup"
      amount
    when "teaspoons"
      amount * 0.0208
    when "gram"
      amount/128.0
    end
  end

  def convert_to_teaspoon(amount, unit)
    case unit
    when "kilogram"
      amount * 202.8841
    when "cup"
      amount * 48
    when "teaspoons"
      amount
    when "gram"
      amount/5.0
    end
  end
end
