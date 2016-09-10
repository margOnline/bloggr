user = %w(Margo).map { |u| User.create(username: u) }

Post.create(user_id: user.id, message: 'first message')
Post.create(user_id: user.id, message: 'second message')
Post.create(user_id: user.id, message: 'third message')
Post.create(user_id: user.id, message: 'fourth message')
