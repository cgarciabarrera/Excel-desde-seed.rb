# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_cities
  workbook = Spreadsheet::ParseExcel.parse("#{Dir.getwd}/db/data/cities.xls")

  workbook.worksheet(0).each(1) { |row|
    next if row == nil;
    col = row.at(0);
    next if col == nil;
    id = col.to_s('latin1').strip;
    next if id == "";

    country_id = row.at(1).to_s
    state_id = row.at(2).to_s
    name = row.at(3).to_s('utf8').strip;
    code = row.at(4).to_s('utf8').strip;
    puts name.length
    puts code
    city = City.new(:country_id => country_id, :stete_id => state_id, :name => name.to_s, :code => code)

    unless city.save
      city.errors.each { |e| puts "Database Error: ", e }
    end
  }

end

seed_cities()
