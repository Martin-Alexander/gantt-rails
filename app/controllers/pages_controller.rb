class PagesController < ApplicationController
  def main
    @tasks = JSON.parse(Task.all.order(:id).to_json)
  end

  def save
    tasks = JSON.parse(params[:task_list]["other"])["tasks"]
    tasks.each do |task_params|
      task = Task.find(task_params["id"])
      task.update!({
        name: task_params["name"],
        start: Date.parse(task_params["start"]),
        finish: Date.parse(task_params["end"]),
        progress: task_params["progress"].to_i
      })
    end
  end
end
