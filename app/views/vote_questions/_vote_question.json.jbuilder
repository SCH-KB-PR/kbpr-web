json.extract! vote_question, :id, :title, :content, :created_at, :updated_at
json.url vote_question_url(vote_question, format: :json)
json.content vote_question.content.to_s
