require "rubygems"
$: << File.join(File.dirname(__FILE__), "..", "lib")
require 'dummy_record'

class Building < DummyRecord::Factory
  def initialize(options = {})
    defaults = {
      id:           1,
      name:         "Test",
      description:  "Desc",
      city:         "Boulder",
      state:        "CO",
      type:         "Skyscrapper",
      year_built:   2012,
      #floors:       DummyRecord::Factory.build_multi(Floor,3)
    }
    build(defaults.merge(options))
  end
end

class Floor < DummyRecord::Factory
  def initialize(options = {})
    defaults = {
      id: 1,
      number: 1,
      square_feet: 2000,
      building_id: 1,
    }
    build(defaults.merge(options))
  end
end

describe DummyRecord::Factory do
  subject { Building }

  it "should have a dumb #find method" do
    subject.respond_to?(:find).should == true
  end

  it "should have a dumb #all method" do
    subject.respond_to?(:all).should == true
  end

  it "should have a dumb #columns method" do
    subject.respond_to?(:columns).should == true
  end

  it "should have a dumb #save method" do
    subject.new.respond_to?(:save).should == true
  end

  it "should stub out some attr_accessors" do
    p Building.new.inspect
  end
end
