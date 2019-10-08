require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  # initialize test data
  let!(:expenses) { create_list(:expense, 10) }


  describe 'GET /expenses' do
    # make HTTP get request before each example
    before { get '/expenses' }

    it 'returns expenses' do
      expect(response.content_type).to eq "text/html"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  
  # # Test suite for POST /todos
  # describe 'POST /todos' do
  #   # valid payload
  #   let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }
  #
  #   context 'when the request is valid' do
  #     before { post '/todos', params: valid_attributes }
  #
  #     it 'creates a todo' do
  #       expect(json['title']).to eq('Learn Elm')
  #     end
  #
  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end
  #
  #   context 'when the request is invalid' do
  #     before { post '/todos', params: { title: 'Foobar' } }
  #
  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end
  #
  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
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
