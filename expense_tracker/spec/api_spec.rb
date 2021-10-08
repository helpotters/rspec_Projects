# expense_tracker_api_spec.rb

require 'rack/test'
require 'json'
require_relative '../app/api'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it 'records submitted expenses' do
      coffee = {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      }
      def post_expense(_expense)
        post '/expenses', JSON.generate(coffee)
        expect(last_response.status).to eq(200)

        parsed = JSON.parse(last_response.body)
        expect(parsed).to include('expense_id' => a_kind_of(Integer))
        expense.merge('id' => parsed['expense_id'])
      end
    end
  end
end
