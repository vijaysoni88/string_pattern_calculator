class StringPattern < ApplicationRecord
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = ',|\n'

    if numbers.start_with?("//")
      delimiter, numbers = numbers.split("\n", 2)
      delimiters = delimiter[2..-1]  # Remove the "//" prefix
    end

    numbers_array = numbers.split(/#{delimiters}/)

    negatives = numbers_array.select { |num| num.to_i.negative? }
    raise "Negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    numbers_array.map(&:to_i).reject { |num| num > 1000 }.sum
  end
end
