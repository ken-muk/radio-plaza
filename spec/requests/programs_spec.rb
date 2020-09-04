require 'rails_helper'

RSpec.describe "Programs", type: :request do
  describe "GET /programs" do
    it 'リクエストが成功すること' do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
