class PagesController < ApplicationController
  # !!! You'll probably want to add these methods to your tasks controller and give them different names

  # Renders the demo page with the Gantt chart
  def main
    # Turns the list of tasks into a list of hashes

    # !!! You'll probably want to filter by user_id
    @tasks = JSON.parse(Task.all.order(:id).to_json)
  end

  # POST /save
  # Recieves a list of tasks from the hidden form
  def save

    # Creates an array of hashes containing data about each task
    tasks = JSON.parse(params[:task_list]["other"])["tasks"]

    # Iterating through all the task hashes
    tasks.each do |task_params|

      # Look up the correct task from the database
      task = Task.find(task_params["id"])

      # Update it with new data
      task.update!({
        name: task_params["name"],
        start: Date.parse(task_params["start"]),
        finish: Date.parse(task_params["end"]),
        progress: task_params["progress"].to_i
      })
    end
  end
end
