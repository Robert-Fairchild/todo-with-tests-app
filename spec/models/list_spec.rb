require 'rails_helper'

RSpec.describe List, type: :model do
  describe "#complete_all_tasks!" do
    it "should change all tasks to complete" do
      list = List.create(name: "Chores")
      Task.create(list_id: list.id, complete: false)
      Task.create(list_id: list.id, complete: false)
      Task.create(list_id: list.id, complete: true)
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end
end