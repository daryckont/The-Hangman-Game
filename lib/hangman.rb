class Hangman

  BODY_PARTS = 6
  PATTERN = '─' # needs to be something easy to watch from any terminal
  PATH = 'word.txt'

  private

  attr_accessor :secret_word,
                :guessed_word,
                :user_guess,
                :misses,
                :missed_letters

  def initialize
    self.secret_word = pick_a_word
    self.guessed_word = build_guessed_word
    self.misses = 0
    self.missed_letters = ''
  end

  def pick_a_word
    File.read(PATH).split(' ').sample
  end

  def build_guessed_word
    PATTERN * secret_word.size
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

  def take(guess)
    self.user_guess = guess
    search_in_secret_word
    inform_user
  end

end
