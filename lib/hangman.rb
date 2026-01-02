class Hangman

  BODY_PARTS = 6
  PATTERN = '-'
  PATH = 'lib/words.txt'

  private

  attr_accessor :secret_word,
                :guessed_word,
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

  def ended?
    out_of_chances? or guessed?
  end

  def out_of_chances?
    misses.eql?(BODY_PARTS)
  end

  def guessed?
    secret_word.eql?(guessed_word)
  end

  def inform_user
    {
      misses: misses,
      missed: missed_letters,
      guessed_word: guessed_word,
      ended: ended?
    }
  end

  def search_in_secret_word(guess)
    matches = 0

    secret_word.chars.each_with_index do |char, index|
      if char == guess
        self.guessed_word[index] = guess
        matches += 1
      end
    end

    increment_misses(guess) if matches.zero?
  end

  def increment_misses(guess)
    self.misses += 1
    self.missed_letters << guess.upcase
  end

  public

  def take(guess)
    search_in_secret_word(guess)

    if inform_user[:ended]
      inform_user.merge(won: guessed?, secret: secret_word)
    else
      inform_user
    end
  end

end
