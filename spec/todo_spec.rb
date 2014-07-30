require 'rspec'
require 'task'
require 'list'

describe Task do

  before do
    List.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra')
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task=Task.new('scrub the zebra')
    test_task.description.should eq 'scrub the zebra'
  end
end

describe List do
  it 'starts out with an empty list of tasks' do
    test_list = List.new('School stuff')
    test_list.tasks.should eq []
  end

  it 'can add tasks' do
    test_list = List.new("school stuff")
    test_task = Task.new("Learn Ruby")
    test_list.add_task(test_task)
    test_list.tasks.should eq [test_task]
  end

  describe '.all' do
    it 'is empty at first' do
      List.all.should eq []
    end
  end

  describe '.save' do
    it 'adds a list to the array of saved lists' do
      test_list = List.new("home")
      test_list.save
      List.all.should eq [test_list]
    end
  end

  describe '.clear' do
    it 'empties the array of the saved list' do
      List.new("school").save
      List.clear
      List.all.should eq []
    end
  end
end
