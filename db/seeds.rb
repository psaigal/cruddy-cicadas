require '../config/environment.rb'
require 'csv'


CSV.foreach("gi_values.tsv", :headers => true, :header_converters => :symbol, :col_sep => "\t") do |row|
    Food.create!(row.to_hash)
end

