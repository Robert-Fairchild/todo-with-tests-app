require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#toggle_complete!" do
    it "should switch complete to false if it were true" do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it were false" do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe "#toggle_favorite!" do
    it "should switch favorite to false if it were true" do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it "should switch favorite to true if it were false" do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end 
  

  describe "#overdue?" do
    it "should return true if deadline is earlier than now" do
    task = Task.create(deadline: 1.day.ago)
    expect(task.overdue?).to eq(true)
  end
  
  
    it "should return false if deadline is later than now" do
    task = Task.create(deadline: 1.day.from_now)
    expect(task.overdue?).to eq(false)
  end
end 

  describe "#increment_priority!" do
    it "should increase priority by 1" do
      task = Task.create(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end 

    it "should not increment the priotity beyond 10" do
      task = Task.create(priority: 10)
      task.increment_priority!
      expect(task.priority).to eq(10)

    end 
  end 
  describe "#decrement_priority!" do
    it "should decrease priority by 1" do
      task = Task.create(priority: 5)
      task.decrement_priority!
      expect(task.priority).to eq(4)
    end 

    it "should not decrement priority below 1" do
      task = Task.create(priority: 1)
      task.decrement_priority!
      expect(task.priority).to eq(1)

    end 
  end 

end
