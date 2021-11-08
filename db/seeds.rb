Todo.ids.each do |id|
  Todo.delete(id)
end

todos = [
  {title: 'Walk the dog', message: 'Take the dog for a walk'},
  {title: 'Carwash', message: 'Take the car through the carwash'},
  {title: 'Buy milk'},
  {title: 'Cook ham'},
]

todos.each do |item|
  Todo.create(title: item[:title], message: item[:message])
end
