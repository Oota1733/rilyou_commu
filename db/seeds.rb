# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  AdminのEメールとパスワード
Admin.create!(email: "1234@1234.com", password: "12345678")

#ユーザー作成
maria = User.find_or_create_by!(email: "maria@example.com") do |user|
  user.name = "maria"
  user.password = "m1234567"
end

太郎 = User.find_or_create_by!(email: "taro@example.com") do |user|
  user.name = "taro"
  user.password = "i1234567"
end

lucas = User.find_or_create_by!(email: "lucas@example.com") do |user|
  user.name = "Lucas"
  user.password = "y1234567"
end


#タグの作成
tags = %w(現代文　数学　物理)
tags.each { |tag_name| ActsAsTaggableOn::Tag.find_or_create_by(name: tag_name) }




