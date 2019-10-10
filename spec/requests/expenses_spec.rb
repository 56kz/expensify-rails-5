require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  # initialize test data
  let!(:expenses) { create_list(:expense, 10) }

  #
  # describe 'GET /expenses' do
  #   # make HTTP get request before each example
  #   before { get '/expenses' }
  #
  #   it 'returns expenses' do
  #     expect(response.content_type).to eq "text/html"
  #   end
  #
  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end
  # end






  describe 'POST /expenses' do
    context "with valid atr" do



      # it "rsspondos html" do
      #   post :create, { :expense => { :concept => "An awesome product", :date => "08-10-2019", :amount => 56, :type => "purchase", :category => "fun" } }
      #   expect(response.content_type).to eq "text/html"
      # end
      #URL incorrecta


      # it 'create a new product' do
      #   params = {
      #    concept: 'An awesome product',
      #    amount: 50,
      #    date: "08-10-2019",
      #    category: "fun",
      #    type: "purchase"
      #   }
      #   expect { post(params: { expense: params }) }.to change(Expense, :count).by(1)
      #   # expect(flash[:notice]).to eq 'Product was successfully created.'
      # end
      #URL incorrecta



     before { post '/expenses', params: { :expense => { :concept => "An awesome product", :date => "08-10-2019", :amount => 56, :type => "purchase", :category => "fun"  } }, xhr: true }


     it "respond with html" do
       expect(Expense, :count).by(1)
       # expect(flash[:notice]).to eq 'Product was successfully created.'       
     end

     # ActionController::UnknownFormat:
     #   ExpensesController#create is missing a template for this request format and variant.
     #
     #   request.formats: ["text/html"]
     #   request.variant: []





    end
  end








  # # Test suite for POST /todos
  # describe 'POST /expenses' do
  #   # valid payload
  #   let(:valid_attributes) { { concept: 'Learn Elm', date: '08-10-2019', amount: 34, type: "purchase", category: "fun" } }
  #
  #   context 'when the request is valid' do
  #     before { post '/expenses', params: valid_attributes }
  #
  #     it 'creates a todo' do
  #       expect(response.content_type).to eq "text/html"
  #     end
  #
  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end
  #
  #   context 'when the request is invalid' do
  #     before { post '/expenses', params: { title: 'Foobar' } }
  #
  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end
  #
  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Amount can't be blank/)
  #     end
  #   end
  # end






  # describe 'POST /expenses' do
  #   it "responds to html" do
  #     post '/expenses', { :expense =>  { :concept => "wua", :amount => 34, :date => "08-10-2019", :type => "purchase", :category => "fun" } }
  #   end
  # end

  #
  # # Test suite for PUT /todos/:id
  # describe 'PUT /todos/:id' do
  #   let(:valid_attributes) { { title: 'Shopping' } }
  #
  #   context 'when the record exists' do
  #     before { put "/todos/#{todo_id}", params: valid_attributes }
  #
  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end
  #
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end
  #
  # # Test suite for DELETE /todos/:id
  # describe 'DELETE /todos/:id' do
  #   before { delete "/todos/#{todo_id}" }
  #
  #   it 'returns status code 204' do
  #     expect(response).to have_http_status(204)
  #   end
  # end
end
