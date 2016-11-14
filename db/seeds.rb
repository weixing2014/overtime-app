@user = User.create(email: "weixing1985@gmail.com", password: "#bosnich856212", password_confirmation: "#bosnich856212", first_name: "Xing", last_name: "Wei")
@admin_user = AdminUser.create(email: "xing.wei@appfolio.com", password: "#bosnich856212", password_confirmation: "#bosnich856212", first_name: "Xing", last_name: "Wei")

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: @user)
end

puts "100 posts have been created."
