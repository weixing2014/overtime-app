require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    @post_1 = FactoryGirl.create(:post, user: @user, rationale: 'post_1')
    @post_2 = FactoryGirl.create(:post, user: @user, rationale: 'post_2')
    login_as(@user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      expect(page).to have_css("h1", text: "Posts")
    end

    it 'has a list of posts' do
      visit posts_path
      expect(page).to have_content("post_1")
      expect(page).to have_content("post_2")
    end
  end

  describe 'create' do
    before do
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

  describe 'edit' do

  end
end
