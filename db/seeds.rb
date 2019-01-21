def load_voters1
	csv_text = File.read(Rails.root.join('lib', 'voters1.csv'))
	csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
	csv.each do |row|
		voter = Voter.new(
			vote_preference: row["vote_preference"].downcase,
			street_number: row["street_number"],
			street_name: row["street_name"],
			city: row["city"],
			state: row["state"],
			postal_code: row["postal_code"]
			)
			voter.save
			print '*'
		end
	end
	
	def load_voters2
		csv_text = File.read(Rails.root.join('lib', 'voters2.csv'))
		csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
		csv.each do |row|
			voter = Voter.new(
				vote_preference: row["vote_preference"].downcase,
				street_number: row["street_number"],
				street_name: row["street_name"],
				city: row["city"],
				state: row["state"],
				postal_code: row["postal_code"]
		)
		voter.save
		print '*'
	end
end
 
def truncate_database
	puts 'truncate_voters_table ------------------------------------'
	Voter.all.each{|v| v.delete}
	ActiveRecord::Base.connection.reset_pk_sequence!('voters')
end

def main
	truncate_database
	load_voters1
	load_voters2
end

main