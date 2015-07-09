require 'rails_helper'

RSpec.describe "site_news/show", type: :view do
  before(:each) do
    @site_news = assign(:site_news, SiteNews.create!(
      :title => "Title",
      :body => "MyText",
      :belongs_to => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
