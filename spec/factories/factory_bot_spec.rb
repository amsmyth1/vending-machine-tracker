require 'rails_helper'

RSpec.describe "test factories" do
  it "can create machines and owners" do
    machine = create(:machine)
    owner = create(:owner)

    expect(machine.class).to eq(Machine)
    expect(owner.class).to eq(Owner)
  end
end
