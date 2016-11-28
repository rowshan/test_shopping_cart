class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a + ('0' .. '9').to_a

  def self.random_string(length = 8)
    (0 .. length).map { ALPHABET[rand(ALPHABET.size)] }.join
  end
end
