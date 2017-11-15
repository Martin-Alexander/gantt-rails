Task.destroy_all

task_one = Task.create!({
	name: "Task One",
	start: Date.today,
	finish: Date.today + 1,
	progress: 10,
	dependencies: ""
})

task_two = Task.create!({
	name: "Task Two",
	start: Date.today + 1,
	finish: Date.today + 2,
	progress: 20,
	dependencies: "#{task_one.id}"
})

Task.create!({
	name: "Task Three",
	start: Date.today + 2,
	finish: Date.today + 3,
	progress: 90,
	dependencies: "#{task_two.id}"
})