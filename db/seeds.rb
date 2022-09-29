# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# DIRECTLY CREATING THE SEED FOR THE CATEGORY MODEL
Category.create!([
  {
    name: 'Fruvar',
    description: 'Frutas y verduras'
  },
  {
    name: 'Harinas',
    description: 'Harinas en todas sus presentaciones'
  },
  {
    name: 'Pasta',
    description: 'Pastas'
  },
  {
    name: 'Gaseosas',
    description: 'Bebidas gaseosas'
  },
  {
    name: 'Granos',
    description: 'Arroces, frijoles y demas productos'
  },
  {
    name: 'Salsas',
    description: 'Salsas de todo tipo en diferentes presentaciones'
  },
  {
    name: 'Carnes Frias',
    description: 'Embutidos y diferentes carnes procesadas'
  },
  {
    name: 'Carne',
    description: 'Carne por libra'
  },
  {
    name: 'Panaderia',
    description: 'Productos de panaderia'
  },
  {
    name: 'Cereales',
    description: 'Cereales procesados para el desayuno'
  },
  {
    name: 'Chucherias',
    description: 'Paquetes variados'
  },
  {
    name: 'Congelados',
    description: 'Productos precocidos congelados para la AirFryer pricipalmente'
  },
  {
    name: 'Arepas',
    description: 'Todo tipo de arepas'
  },
  {
    name: 'Jugos',
    description: 'Bebidas naturales de fruta'
  },
  {
    name: 'Lacteos',
    description: 'Productos derivados de la leche'
  },
  {
    name: 'Galletas',
    description: 'Productos de galleta'
  },
  {
    name: 'Aseo',
    description: 'Productos de aseo para el hogar'
  },
  {
    name: 'Enlatados',
    description: 'Productos enlatados'
  }
])

# FROM SEED FILES from the folder seed_files
Dir[File.join(Rails.root, 'db', 'seed_files', '*.rb')].sort.each do |seed|
  load seed
end