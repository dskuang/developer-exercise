require 'byebug'
class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".


  def self.marklar(str)
    str.split(" ").map! do |word|
      #gets punctuation either as a word or empty string
      punc_char = self.get_punc(word)

      #removes last character if their is a punctuation
      word = word[0..-2] if punc_char != ""

      #checks if first letter is uppercase and length is greater than 4
      if word[0].is_upper? && word.length > 4
        "Marklar" + punc_char

      #checks if length is greater than 4
      elsif word.length > 4
        "marklar" + punc_char

      #returns word if its not greater than length 4
      else
        word
      end

    end.join(" ")
  end

  #this method checks if the last character is either ? or . and returns that
  def self.get_punc(word)
    if word[-1] == "?"
      "?"
    elsif word[-1] == "."
      "."
    else
      ""
    end
  end

  #selects all the even fibs and then sums them up
  def self.even_fibonacci(nth)
    values = self.get_fibonacci(nth)
    values.inject(0) do |sum, n|
      n.even? ? sum + n : sum
    end
  end

  #gets all the nth fibonacci numbers recursively
  def self.get_fibonacci(nth)
    return [] if nth <= 0
    return [1] if nth == 1
    return [1, 1] if nth == 2
    arr = get_fibonacci(nth - 1)

    #adds last 2 numbers in array and pushes that into array
    arr << arr[-2] + arr[-1]
  end
end


class String
  def is_upper?
    self == self.upcase
  end
end
