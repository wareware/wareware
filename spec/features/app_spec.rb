# coding:utf-8
require 'spec_helper'

describe "Application" do
  context 'トップページにアクセスする' do
    before do
      visit '/'
    end

    it 'コンテンツが表示されること', js: true do
      page.should have_content('Welcome')
    end
  end
end
