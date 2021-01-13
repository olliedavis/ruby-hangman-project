require 'json'

class Save

  def initialize(save_name, pc_word, lives, used_letters, board)
    @save_name = save_name
    @pc_word = pc_word
    @lives = lives
    @used_letters = used_letters
    @board = board
    save_game(@save_name)
  end

  def save_game_prompt
    puts "What would you like to name your save?"
    save_name = gets.chomp.downcase.strip
    puts "Game saved as '#{save_name}'" 
    save_game(save_name)
  end

  def save_game(save_name)
    self_json = {pc_word: @pc_word, lives_left: @lives_left, letters_used: @letters_used, board: @board, correct_count: @correct_count}.to_json
    open("#{save_name}.json", "a") do |file|
      file.puts self_json
    end
  end
end