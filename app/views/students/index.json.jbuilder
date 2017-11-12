json.array!(@students) do |student|
  json.extract! student, :id, :firstname, :lastname, :birthday, :address, :studentid
  json.url student_url(student, format: :json)
end
