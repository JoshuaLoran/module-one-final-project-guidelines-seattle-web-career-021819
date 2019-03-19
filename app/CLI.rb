class CLI

	def self.run
		puts "Running CLI..."
		is_running = true
		while is_running
			fork{ exec 'afplay', "app/GameofThrones.mp3" }
			self.main_menu
			input= STDIN.gets.chomp
			case input
			when "0"
				fork{ exec 'killall', "afplay" }
				is_running = false
			when "1"
				self.character
			when "2"
				self.book
			when "3"
				self.house
			else
				puts "Invalid input."
			end
		end
	end

	def self.main_menu
		puts "\n\n\n\n\n\n\n\n\n\n\n\n"
		Dragon.display
		puts <<~MAIN_MENU
			Which category would you like to choose?
			0. Exit
			1. Characters
			2. Books
			3. Houses
		MAIN_MENU
	end

	def self.character
		self.num_characters
		self.character_lookup
	end

	def self.num_characters
		is_running = true
		while is_running
			puts <<~HOW_MANY_CHARACTERS
				=========================================================
				Think you know how many characters are in G.O.T? (yes/no)
				=========================================================
			HOW_MANY_CHARACTERS
	    input = STDIN.gets.chomp
		  if input.starts_with? "y" || input == "yes"
		  	puts "Give me your best guess.."
		    input = STDIN.gets.chomp.to_i
				answer = Character.distinct.pluck(:name).count
			  if input == answer
			  	puts "Congratulations, you are officially a G.O.T NERD"
			    is_running = false
			  else
			    puts "Nice try, the correct Answer is #{answer}"
					puts "Onward to the characters so you can NERD UP!!"
					is_running = false
				end
			elsif input.starts_with? "n" || input == "no"
		  	puts "Ok, onward to the characters info so you can NERD UP!!"
		    is_running = false
		  else
		  	puts "Invalid input"
	    end
		end
	end

	def self.character_lookup
		is_running = true
		while is_running
			puts <<~CHARACTER_NAME
				===========================================================================
				Enter a name for the Character to lookup or enter 0 to return to main menu.
				===========================================================================
				Suggested Searches (copy and paste works best!):
				================================================
			CHARACTER_NAME

			Character.all.sample(5).pluck(:name).each do |character_name|
				puts character_name
				puts
			end

			puts "================================="


			input = STDIN.gets.chomp
			puts
			puts
			if Character.where(name: input).exists?
				found_character = Character.find_by(name: input)
				brethren = Character.where(house: found_character.house).where.not(name: input)
				brethren_names = brethren.order(:name).distinct.pluck(:name)
				puts brethren_names
				puts "\n"
				UpArrow.display
				puts "#{found_character.name} has allegience with #{found_character.house.name}."
				puts "---------------------------------------------------------------"
				puts "Above are #{found_character.name}'s house brethren"
				puts "\n\n\n\n"
			elsif input == "0"
				is_running = false
			else
				puts "Nobody matches that name"
				puts "Please enter a valid name"
			end
		end
	end

	def self.book
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		is_running = true
		while is_running
			BookArt.display
			puts <<~LIST_OF_BOOKS

				========================================
				Here is a list of Game of Thrones books.
				========================================

			LIST_OF_BOOKS

			books_and_others = Book.all

			main_book_list = [
				books_and_others[0],
				books_and_others[1],
				books_and_others[2],
				books_and_others[4],
				books_and_others[7]
			]

			other_book_list = [
				books_and_others[3],
				books_and_others[5],
				books_and_others[6],
				books_and_others[8],
				books_and_others[9],
				books_and_others[10]
			]

			puts "Books:"
			main_book_list.each_with_index do |book, index|
				puts "#{index+1}. #{book.name}."
			end

			puts "\nGraphic Novels and Satellite stories:"
			other_book_list.each_with_index do |book, index|
				puts "#{index+6}. #{book.name}"
			end

			book_list = main_book_list + other_book_list

			puts "\nEnter a book number to see what a loon George R.R. Martin is, or push 0 to return to main menu"
			puts "\n\n\n\n\n"
			input = STDIN.gets.chomp.to_i
			if input == 0
				is_running = false
			elsif 0 < input && input < 12
				puts "\n\n\n\n\n\n\n\n\n"
				DownArrow.display
				selected_book = book_list[input - 1]
				puts "#{selected_book.name} has #{selected_book.characters.count} characters fighting for the throne."
				puts "\nWHAT A SCUFFLE!!!"
				puts "\n\n"
			else
				puts "Invalid input"
			end
		end
	end


	def self.house
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		HouseArt.display
		self.num_houses
		self.house_lookup
	end

	def self.num_houses
		is_running = true
		while is_running
			puts <<~HOW_MANY_BOOKS





				=====================================================
				Think you know how many houses are in G.O.T? (yes/no)
				=====================================================
			HOW_MANY_BOOKS
	    input = STDIN.gets.chomp
		  if input.starts_with? "y" || input == "yes"
		  	puts "Give me your best guess.."
		    input = STDIN.gets.chomp.to_i
				answer = House.all.count
			  if input == answer
			  	puts "Congratulations, you are officially a G.O.T NERD"
			    is_running = false
			  else
			    puts "Nice try, the correct Answer is #{answer}"
					puts "Onward to the characters so you can NERD UP!!"
					is_running = false
				end
		  elsif input.starts_with? "n" || input == "no"
		  	puts "Ok, onward to the houses info so you can NERD UP!!"
		    is_running = false
		  else
		  	puts "Invalid input"
	    end
			DownArrow.display
		end
	end

	def self.house_lookup
		is_running = true

   	while is_running
			puts <<~HOUSE_NAME

				Enter a house name to find out their Coat of Arms, or press 0 to return to main menu
				====================================================================================
				Suggested Searches (copy and paste works best!):
				================================================

			HOUSE_NAME
			House.all.sample(5).pluck(:name).each do |house_name|
				puts house_name
				puts
			end

			puts "================================="

	    input = STDIN.gets.chomp
	    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
	    found_house = House.find_by(name: input)
	    if found_house != nil
	    	slogan = found_house.coat_of_arms
	      puts slogan
				UpArrow.display
	    elsif input == "0"
      	is_running = false
      else
      	puts "invalid input"
      end
 		end
	end
end
