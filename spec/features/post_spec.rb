require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_css("h1", text: "Posts")
    end
  end
end
