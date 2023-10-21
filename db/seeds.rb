# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  AdminのEメールとパスワード
  Admin.find_or_create_by!(email: "1234@1234.com") do |a|
    a.password = "12345678"
  e
  #ユーザーアカウント配列

  User.find_or_create_by!(email: "maria@example.com") do |u|
    u.password = "m1234567"
    u.last_name = "三木"
    u.first_name = "まりあ"
    u.last_name_kana = "みき"
    u.first_name_kana = "まりあ"
    u.phone_number = 12345678
    u.postal_code = 1234567
    u.address = "神奈川１"
  end

  User.find_or_create_by!(email: "taro@example.com") do |u|
    u.password = "i1234567"
    u.last_name = "山田"
    u.first_name = "太郎"
    u.last_name_kana = "やまだ"
    u.first_name_kana = "たろう"
    u.phone_number = 87654321
    u.postal_code = 1234567
    u.address = "千葉１"
  end

  User.find_or_create_by!(email: "kimura@example.com") do |u|
    u.password = "y1234567"
    u.last_name = "木村"
    u.first_name = "りえ"
    u.last_name_kana = "きむら"
    u.first_name_kana = "りえ"
    u.phone_number = 1234567
    u.postal_code = 1234567
    u.address = "東京１"
  end


  # タグの作成
  tags = %w(現代文 数学 物理 地理)
  tags.each { |tag_name| Tag.find_or_create_by(name: tag_name) }

  # User.all.each do |user|
  #   Community.find_or_create_by!(user_id: user.id) do |p|
  #   p.name = "ルーム１"
  #   p.introduction = "こんにちは"
  #   end
  # end


#    投稿を作成または既存のものを検索
#     post = Post.find_or_create_by!(community_id: community.id) do |p|
#       p.title = "こんんちは"
#       p.body = "こんばんは"
#       p.tag_list.add(tag_list) # タグを追加します。
#       p.user_id = user.id
#     end

#     comment = Comment.find_or_create_by!(post_id: post.id) do |p|
#       p.body = "今日"
#       p.user_id = user.id
#     end


