before '/api/*' do
  content_type :json
end

error ActiveRecord::RecordNotFound do
  api_error 404, 'Not Found (API)'
end

get '/api/v1/locations' do
  @locations = Location.all
  @locations.to_json
end

post '/api/v1/locations' do
  @location = Location.create(params[:location])
  if @location.persisted?
    @location.to_json
  else
    api_error 401, 'Unable to save', @location.errors
  end
  @locations.to_json
end

before '/api/v1/location/:location_id/?*' do
  @location = Location.find(params[:location_id])
end

get '/api/v1/location/:location_id' do
  @location.to_json
end

post '/api/v1/location/:location_id/datapoints' do
  @datapoint = @location.datapoints.new(params[:datapoint])
  if @datapoint.save
    @datapoint.to_json
  else
    api_error 401, 'Unable to save', @datapoint.errors
  end
end

get '/api/v1/location/:location_id/datapoints' do
  @location.datapoints.to_json
end
