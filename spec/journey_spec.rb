# frozen_string_literal: true

require "journey"
describe Journey do
  it "should have empty entry point initially" do
    subject = Journey.new
    expect(subject.entry_point[:entry]).to eq ""
  end
  it "should have empty exit point initially" do
    subject = Journey.new
    expect(subject.exit_point[:exit]).to eq ""
  end
  it "should have content to set of empty hashes" do
    subject = Journey.new
    expect(subject.content).to eq [subject.entry_point, subject.exit_point]
  end
  it "should have passed entry point at initialization" do
    subject = Journey.new("tafalgar")
    expect(subject.content).to eq [{ entry: "tafalgar" }, subject.exit_point]
  end
  it "should have passed exit point at initialization" do
    subject = Journey.new("tafalgar", "stratford")
    expect(subject.content).to eq [{ entry: "tafalgar" }, { exit: "stratford" }]
  end
  it "should save entry point" do
    subject = Journey.new
    subject.save_entry("lion")
    expect(subject.content).to eq [{ entry: "lion" }, subject.exit_point]
  end
  it "should save exit point" do
    subject = Journey.new
    subject.save_exit("lion")
    expect(subject.content).to eq [subject.entry_point, { exit: "lion" }]
  end
end
