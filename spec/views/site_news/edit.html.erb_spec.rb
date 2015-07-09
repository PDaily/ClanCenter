require 'rails_helper'

RSpec.describe "site_news/edit", type: :view do
  before(:each) do
    @site_news = assign(:site_news, SiteNews.create!(
      :title => "MyString",
      :body => "MyText",
      :belongs_to => ""
    ))
  end

  it "renders the edit site_news form" do
    render

    assert_select "form[action=?][method=?]", site_news_path(@site_news), "post" do

      assert_select "input#site_news_title[name=?]", "site_news[title]"

      assert_select "textarea#site_news_body[name=?]", "site_news[body]"

      assert_select "input#site_news_belongs_to[name=?]", "site_news[belongs_to]"
    end
  end
end
