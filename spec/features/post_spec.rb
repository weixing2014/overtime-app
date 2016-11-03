require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      @user = User.create(email: "setup@test.com", password: "123456", password_confirmation: "123456")
      login_as(@user, scope: :user)
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      expect(page).to have_css("h1", text: "Posts")
    end

    it 'has a list of posts' do
      Post.create!(date: Date.today, rationale: "post_1", user: @user)
      Post.create!(date: Date.today, rationale: "post_2", user: @user)
      visit posts_path
      expect(page).to have_content("post_1")
      expect(page).to have_content("post_2")
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "setup@test.com", password: "123456", password_confirmation: "123456")
      login_as(user, scope: :user)
      visit new_post_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
      expect(page).to have_css("form")
    end

    it 'can create new post through the form' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("Some rationale")
    end
  end
end
