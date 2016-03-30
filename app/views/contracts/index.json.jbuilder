json.array!(@contracts) do |contract|
  json.extract! contract, :id, :contract, :status
  json.url contract_url(contract, format: :json)
end
