puts 'Creating User...'

User.create!(
  id: 1,
  email: 'admin@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '管理人',
  profile: 'よろしくお願いします。',
  role: :admin,
  image: File.open("#{Rails.root}/db/fixtures/images/users/1.png"),
)

User.create!(
  id: 2,
  email: 'user1@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '山田',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/users/2.png"),
)

User.create!(
  id: 3,
  email: 'user2@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '田中',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/users/3.png"),
)

User.create!(
  id: 4,
  email: 'user3@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '鈴木',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/users/4.png"),
)

User.create!(
  id: 5,
  email: 'test@example.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: 'テストユーザー',
  profile: 'テストユーザーです。よろしくお願いします。',
  role: :user,
)

users = User.all
users.each do |user|
  user.activate!
end

puts 'Completed!'

puts 'Creating RamenShop...'

RamenShop.create!(
  id: 1,
  name: '麵屋1',
  prefecture: 13,
  address: '東京都新宿区西早稲田2-21-7',
  latitude: 35.710611,
  longitude: 139.709956,
  phone: 123-456-7890,
  image: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/1.jpg")
)

RamenShop.create!(
  id: 2,
  name: '麵屋2',
  prefecture: 1,
  address: '北海道札幌市豊平区美園１０条５丁目３−１２',
  latitude: 43.035237,
  longitude: 141.381926,
  phone: 123-456-7890,
  image: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/2.jpg")
)

RamenShop.create!(
  id: 3,
  name: '麵屋3',
  prefecture: 47,
  address: '沖縄県那覇市金城５－４－６',
  latitude: 26.197937,
  longitude: 127.666322,
  phone: 123-456-7890,
  image: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/3.jpg")
)

puts 'Completed!'

puts 'Creating Review...'

Review.create!(
  id: 1,
  title: '○○なラーメンでした',
  shop_name: '麵屋1',
  prefecture: 13,
  address: '東京都新宿区西早稲田2-21-7',
  taste: 1,
  rate: 4.5,
  body: '美味しかったです',
  images: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/1.jpg"),
  user_id: 2,
  ramen_shop_id: 1
)

Review.create!(
  id: 2,
  title: '◇◇なラーメンでした',
  shop_name: '麵屋2',
  prefecture: 1,
  address: '北海道札幌市豊平区美園１０条５丁目３−１２',
  taste: 2,
  rate: 4,
  body: '美味しかったです',
  images: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/2.jpg"),
  user_id: 3,
  ramen_shop_id: 2
)

Review.create!(
  id: 3,
  title: '××なラーメンでした',
  shop_name: '麵屋3',
  prefecture: 47,
  address: '沖縄県那覇市金城５－４－６',
  taste: 3,
  rate: 5,
  body: '美味しかったです',
  images: File.open("#{Rails.root}/db/fixtures/images/ramen_shops/3.jpg"),
  user_id: 4,
  ramen_shop_id: 3
)

puts 'Completed!'