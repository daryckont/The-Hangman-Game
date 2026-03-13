require 'io/console'
require_relative '../lib/hangman'

class Player

  private

  attr_accessor :hangman, :record

  def initialize
    self.hangman = Hangman.new
    self.record = {}
  end

  def finish
    record[:misses] == Hangman::BODY_PARTS or record[:guessed]
  end

  def match_info
    "Misses: #{record[:misses]}  Failed: #{record[:missed]}
     \n#{record[:guessed_word]}
    "
  end

  def clear_screen
    $stdout.clear_screen
  end

  def final_message
    if record[:guessed]
      "Congrats, you guessed the secret word!👏👏👏"
    else
      "Sorry, you lost. Let me reach you the rope 😜"
    end
  end

  public

  def play
    hangman.choose_secret

    puts "Welcome to The Hangman Game"

    until finish
      print "Insert your guess: "
      self.record = hangman.take(gets.chomp.downcase)
      clear_screen
      puts match_info
    end

    puts final_message
  end

end

Player.new.play
