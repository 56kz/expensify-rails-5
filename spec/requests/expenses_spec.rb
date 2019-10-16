require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  # initialize test data
  let!(:expenses) { create_list(:expense, 10) }
  let(:expense_id) { expenses.first.id }


  describe 'GET /expenses' do
    # make HTTP get request before each example
    before { get '/expenses' }

    it 'returns 10 expenses in html' do
      expect(assigns(:expenses).count).to eq 10
      expect(response.content_type).to eq "text/html"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'POST /expenses' do
    context "with valid atr" do
     before { post '/expenses', params: { :expense => { :concept => "An awesome product", :date => "08-10-2019", :amount => 56, :type => "purchase", :category => "fun"  } }, xhr: true }

     it "When the request is valid" do
       expect(response.content_type).to eq "text/javascript"
     end

     it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end
    end

    context 'when the request is invalid' do
     before { post '/expenses', params: { :expense => { :concept => "Call me on my cellphone" } }, xhr: true }

     it 'returns status code 200' do
       expect(response).to have_http_status(200)
     end

     it 'returns a validation failure message' do
       expect(response.body).to match(/Amount can&#39;t be blank/)
      end
    end
  end



   describe 'PUT /expenses/:id' do
     context 'when the expense exists' do
       before { put "/expenses/#{expense_id}", params: { :expense => { :concept => "An awesome product edited" } } }

       it 'returns status code 302' do
         expect(response).to have_http_status(302)
       end
     end
   end




  describe 'DELETE /expenses/:id' do
    before { delete "/expenses/#{expense_id}" }

    it 'returns status code 302' do
      expect(response).to have_http_status(302)
    end
  end

end
