@user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "Xing", last_name: "Wei")

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: @user)
end

puts "100 posts have been created."
