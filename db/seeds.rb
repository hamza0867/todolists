User.destroy_all

User.create! [
  { username: 'Fiorina', password_digest: 'lol_Italy' },
  { username: 'Trump', password_digest: 'we_need_WALL' },
  { username: 'Carson', password_digest: '1_day' },
  { username: 'Clinton', password_digest: 'I_hate_ARAFATE' }
]

Profile.create! [
  { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: 'female' },
  { first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: 'male' },
  { first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: 'male' },
  { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: 'female' }
]

User.all.each do |usr|
  usr.profile = Profile.find_by(last_name: usr.username)
  todo_lsts = TodoList.create! [{
    list_name: "todo list for #{usr.username}",
    list_due_date: (Date.today + 1.year)
  }]
  (1..5).each do |i|
    todo_lsts.first.todo_items << TodoItem.create!(
      due_date: (Date.today + i.year),
      title: 'some title',
      description: 'Some loooooong assss description'
    )
  end
  usr.todo_lists = todo_lsts
end
