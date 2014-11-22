json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :subject, :from, :body
  json.url ticket_url(ticket, format: :json)
end
