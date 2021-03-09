json.extract! intervention, :id, :date, :summary, :details, :intervention_state_id, :device_id, :intervention_type_id, :user_id, :created_at, :updated_at
json.url intervention_url(intervention, format: :json)
