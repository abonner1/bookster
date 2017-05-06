require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(username: "alice 12b", email: "alice12b@gmail.com", password: "alice21")
  end

  it "can slug the username" do
    expect(@user.slug).to eq("alice-12b")
  end

  it "can find a user based on the slug" do
    slug = @user.slug
    expect(User.find_by_slug(slug).username).to eq("alice 12b")
  end

  it 'has a secure password' do
    expect(@user.authenticate("book")).to eq(false)
    expect(@user.authenticate("alice21")).to eq(@user)
  end

end
