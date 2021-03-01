json.extract! intervention, :id, :date, :summary, :details, :state, :device_id, :intervention_type_id, :user_id, :created_at, :updated_at
json.url intervention_url(intervention, format: :json)
