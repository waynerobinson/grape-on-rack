module Acme
  class Ping < Grape::API
    format :json

    get '/ping' do
      { ping: 'pong' }
    end

    get '/ping_binary' do
      env['api.format'] = :binary
      content_type 'application/json'
      { ping: 'pong' }.to_json
    end

    get '/ping_txt' do
      env['api.format'] = :txt
      content_type 'application/json'
      { ping: 'pong' }.to_json
    end

    get '/ping_header' do
      env['api.format'] = :binary
      header 'Content-Type', 'application/json'
      { ping: 'pong' }.to_json
    end

    get '/ping_other_header' do
      env['api.format'] = :binary
      content_type 'text/plain'
      { ping: 'pong' }.to_json
    end
  end
end
