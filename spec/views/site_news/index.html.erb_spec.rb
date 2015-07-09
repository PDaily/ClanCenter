require 'rails_helper'

RSpec.describe "site_news/index", type: :view do
  before(:each) do
    assign(:site_news, [
      SiteNews.create!(
        :title => "Title",
        :body => "MyText",
        :belongs_to => ""
      ),
      SiteNews.create!(
        :title => "Title",
        :body => "MyText",
        :belongs_to => ""
      )
    ])
  end

  it "renders a list of site_news" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
