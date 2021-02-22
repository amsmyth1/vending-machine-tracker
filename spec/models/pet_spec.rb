require 'rails_helper'

describe Snack do
  describe "relationships" do
    it { should have_many :machine_snacks}
    it { should have_many(:machines).through(:machine_snacks) }
  end
end
