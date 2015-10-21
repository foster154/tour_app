json.array!(@agents) do |agent|
  json.extract! agent, :user_id, :name, :company, :phone, :email, :website
  json.url agent_url(agent, format: :json)
end