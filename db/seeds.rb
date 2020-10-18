User.create!(
  [
    {
      nickname: '出品者', 
      first_name: '鈴木', 
      last_name: '太郎', 
      first_name_kana: 'スズキ',
      last_name_kana: 'タロウ', 
      email: 'sample@com',
      password: 'admin456',
      birthday: '1999-05-05' 
    },
    {
      nickname: '購入者', 
      first_name: '佐藤', 
      last_name: '太郎', 
      first_name_kana: 'サトウ',
      last_name_kana: 'タロウ', 
      email: 'test@com',
      password: 'admin123',
      birthday: '1999-05-05' 
    },
  ]
)