require 'rails_helper'

RSpec.describe "snack show page" do
  before :each do
    @owner_1 = Owner.create!({name: "Viper Vends"})
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

    @machine_1.snack << @twix
    @machine_1.snack << @snickers
    @machine_1.snack << @cheetos
    @machine_1.snack << @lays

    @machine_2.snack << @almonds
    @machine_2.snack << @cliff
    @machine_2.snack << @fruit
    @machine_2.snack << @peas

    @machine_3.snack << @twix
    @machine_3.snack << @snickers
    @machine_3.snack << @cheetos
    @machine_3.snack << @lays
    @machine_3.snack << @almonds
    @machine_3.snack << @cliff
    @machine_3.snack << @fruit
    @machine_3.snack << @peas
  end

  describe "display snack information" do
    it "can display the name, price" do
      visit "snacks/#{@twix.id}"

      within ".snack_info#basic" do
        expect(page).to have_content(@twix.name)
        expect(page).to have_content(@twix.price)
      end
    end

    it "can display the locations the snack is sold" do
      visit "snacks/#{@twix.id}"

      within ".snack_info#locations" do
        expect(page).to have_content("Locations")
        expect(page).to have_content(@machine_1.location)
        expect(page).to have_content(@machine_3.location)
        expect(page).to_not have_content(@machine_2.location)
      end
    end
  end
end
