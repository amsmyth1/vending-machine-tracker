require 'rails_helper'

RSpec.describe Machine, type: :model do
  before :each do
    @owner_1 = Owner.create!({name: "Candy Vends"})
    @machine_1 = @owner_1.machines.create({location: "100 5th Ave"})
    @twix = Snack.create!({name: "Twix", price: 1.50})
    @snickers = Snack.create!({name: "Snickers", price: 1.50})
    @lays = Snack.create!({name: "Baked Lays", price: 2.00})
    @cheetos = Snack.create!({name: "Cheetos", price: 1.00})
    @machine_1.snack << @twix
    @machine_1.snack << @snickers
    @machine_1.snack << @cheetos
    @machine_1.snack << @lays
  end

  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "instance methods" do
    describe "#average_snack_price" do
      it "can return the average snack price in BigDecimal" do
        expect(@machine_1.average_snack_price).to eq(1.5)

      end
    end
  end
end
