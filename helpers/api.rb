helpers do
  def api_error code, message = "Internal Error", errors = {}
    content_type :json
    halt code, {:message => message,  :errors => errors }.to_json
  end
end