require 'rails_helper'

RSpec.describe "machine show page" do
  before :each do
    @owner_1 = Owner.create!({name: "Candy Vends"})
    @owner_2 = Owner.create!({name: "Heealthy Vends"})
    @owner_3 = Owner.create!({name: "Shell Vends"})

    @machine_1 = @owner_1.machines.create({location: "100 5th Ave"})
    @machine_2 = @owner_1.machines.create({location: "200 5th Ave"})
    @machine_3 = @owner_1.machines.create({location: "300 5th Ave"})

    @twix = Snack.create!({name: "Twix", price: 1.50})
    @snickers = Snack.create!({name: "Snickers", price: 1.50})
    @lays = Snack.create!({name: "Baked Lays", price: 2.00})
    @cheetos = Snack.create!({name: "Cheetos", price: 1.00})

    @almonds = Snack.create!({name: "Nature's Almonds", price: 3.00})
    @cliff = Snack.create!({name: "Cliff Bar", price: 4.00})
    @fruit = Snack.create!({name: "Dried apples", price: 2.00})
    @peas = Snack.create!({name: "Wasabi peas", price: 5.00})
  end

  describe "displays vending machine information" do
    it "can display the associated snacks and their price" do
      @machine_1.snack << @twix
      @machine_1.snack << @snickers
      @machine_1.snack << @cheetos
      @machine_1.snack << @lays

      @machine_2.snack << @almonds
      @machine_2.snack << @cliff
      @machine_2.snack << @fruit
      @machine_2.snack << @peas

      visit "/owners/#{@owner_1.id}/machines/#{@machine_1.id}"

      within ".machine_snacks" do
        expect(page).to have_content(@twix.name)
        expect(page).to have_content(@twix.price)
        expect(page).to have_content(@snickers.name)
        expect(page).to have_content(@snickers.price)
        expect(page).to have_content(@cheetos.name)
        expect(page).to have_content(@cheetos.price)
        expect(page).to have_content(@lays.name)
        expect(page).to have_content(@lays.price)
      end
    end
  end
end
