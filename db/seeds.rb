users = %w(Margo).map {|u| User.create(username: u)}

Post.create(user_id: 1, message: "first message lots of characters \n with a newline" )
Post.create(user_id: 1, message: "second message")
Post.create(user_id: 1, message: "third message fewer characters no new line")
Post.create(user_id: 1, message: "fourth message\n more than one\n new line\nanother new line")
