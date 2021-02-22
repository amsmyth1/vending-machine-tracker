# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MachineSnack.destroy_all
Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

owner_1 = Owner.create!({name: "Vends R Us"})
owner_2 = Owner.create!({name: "Viper Vending"})
owner_3 = Owner.create!({name: "All o' the Vends"})

machine_1 = owner_1.machines.create({location: "100 5th Ave"})
machine_2 = owner_1.machines.create({location: "200 5th Ave"})
machine_3 = owner_1.machines.create({location: "300 5th Ave"})

twix = Snack.create!({name: "Twix", price: 1.50})
snickers = Snack.create!({name: "Snickers", price: 1.50})
lays = Snack.create!({name: "Baked Lays", price: 2.00})
cheetos = Snack.create!({name: "Cheetos", price: 1.00})

almonds = Snack.create!({name: "Nature's Almonds", price: 3.00})
cliff = Snack.create!({name: "Cliff Bar", price: 4.00})
fruit = Snack.create!({name: "Dried apples", price: 2.00})
peas = Snack.create!({name: "Wasabi peas", price: 5.00})


machine_1.snack << twix
machine_1.snack << snickers
machine_1.snack << cheetos
machine_1.snack << lays

machine_2.snack << almonds
machine_2.snack << cliff
machine_2.snack << fruit
machine_2.snack << peas
