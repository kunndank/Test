# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


["Sports", "Culture", "Politics", "Business"].each do |ac|
    ArticleCategory.where(:code=>ac.downcase).first_or_create do |r|
	    r.name = ac
        r.code = ac.downcase.gsub(' ','_')
        r.is_active = true
        r.position = ArticleCategory.all.count + 1
	end
end