class UserService
  class << self
    def connection
      Faraday.new(url: 'http://localhost:5000/api/v1/')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def send_user_email(email)
      response = connection.get("users") do |faraday|
        faraday.params['email'] = email
      end
      parse_json(response)[:data]
    end
  end
end