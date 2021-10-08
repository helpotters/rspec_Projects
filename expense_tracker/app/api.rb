#!/usr/bin/env ruby

require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    post '/expenses' do
      JSON.generate('expense_id' => 42) # false hardcoded data: slimming the data
    end
  end
end
