class Seed

	def self.run
		puts "Seeding data into local database..."

		puts "Destroying Existing Data"
		House.destroy_all
		Book.destroy_all
		Character.destroy_all

		###### Load houses ######
		puts "Seeding Houses"

		(0..442).each do |house_index|
			house_hash = GameOfThronesApi.get_houses[house_index]
			House.create({
				:name => house_hash["name"],
				:coat_of_arms => house_hash["coatOfArms"],
				:house_url => house_hash["url"]
			})
		end

		##### Load books #####
		puts "Seeding Books"

		(0..10).each do |book_index|
			book_hash = GameOfThronesApi.get_books[book_index]
			Book.create({
				:name => book_hash["name"],
				:book_url => book_hash["url"]
			})
		end

		###### Load characters ######
		puts "Seeding Characters"

		(0..2133).each do |character_index|
			character_hash = GameOfThronesApi.get_characters[character_index]

			book_url = character_hash["books"].first
			book = Book.find_by(book_url: book_url)

			house_url = character_hash["allegiances"].first
			house = House.find_by(house_url: house_url)

			Character.create({
				:name => character_hash["name"],
				:book => book,
				:house => house
			})
		end

	end

	def self.get_json(url)
    response = RestClient.get(url)
    json = JSON.parse(response.body)
  end
end
