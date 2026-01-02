require 'io/console'
require_relative '../lib/hangman'

class Player

  private

  attr_accessor :hangman, :info

  def initialize
    self.hangman = Hangman.new
    self.info = {}
  end

  def match_info
    info.select { |key, value| key.match(/misses|missed|guessed_word/) }
  end

  def report
    "Misses: %<misses>i Failed: %<missed>s\nGuessed Word: %<guessed_word>s" %
      match_info
  end

  def clear_screen
    $stdout.clear_screen
  end

  def final_message
    if info[:won]
      "Congrats, you guessed the secret word!👏👏👏"
    else
      "Sorry, you lost. Let me reach you the rope 😜"
    end << "\n\nThe word was #{info[:secret]}."
  end

  public

  def play
    puts "Welcome to The Hangman Game"

    until info[:ended]
      print "\nInsert your guess: "
      self.info = hangman.take(gets.chomp.downcase)
      clear_screen
      puts report
    end

    puts final_message
  end

end

Player.new.play
