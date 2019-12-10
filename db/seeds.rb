User.create!(
  id: 1,
  email: 'admin@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '管理人',
  profile: 'よろしくお願いします。',
  role: :admin,
  image: File.open("#{Rails.root}/db/fixtures/images/0.png"),
)

User.create!(
  id: 2,
  email: 'user1@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '山田',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/1.png"),
)

User.create!(
  id: 3,
  email: 'user2@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '田中',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/2.png"),
)

User.create!(
  id: 4,
  email: 'user3@gmail.com',
  password: '12341234',
  password_confirmation: '12341234',
  name: '鈴木',
  profile: 'よろしくお願いします。',
  role: :user,
  image: File.open("#{Rails.root}/db/fixtures/images/3.png"),
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