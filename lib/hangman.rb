require_relative 'word'

class Hangman

  BODY_PARTS = 6
  PATTERN = '-' # needs to be something easy to watch from any terminal

  private

  attr_accessor :secret_word,
                :guessed_word,
                :user_guess,
                :misses,
                :missed_letters

  def initialize
    self.misses = 0
    self.missed_letters = ''
  end

  def guessed?
    secret_word == guessed_word
  end

  def inform_user
    {
      guessed_word: guessed_word,
      misses: misses,
      missed: missed_letters,
      guessed: guessed?
    }
  end

  def search_in_secret_word
    matches = 0

    secret_word.chars.each_with_index do |char, index|
      if char == user_guess
        self.guessed_word[index] = user_guess
        matches += 1
      end
    end

    increment_miss if matches.zero?
  end

  def increment_miss
    self.misses += 1
    self.missed_letters << user_guess.upcase
  end

  public

  def choose_secret
    self.secret_word = WORD[rand(WORD.size)]
    self.guessed_word = PATTERN * secret_word.length
  end

  def take(guess)
    self.user_guess = guess
    search_in_secret_word
    inform_user
  end

end
