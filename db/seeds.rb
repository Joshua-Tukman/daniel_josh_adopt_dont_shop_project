# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.delete_all
Pet.delete_all

shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                            address: "555 Indiana Ave",
                            city: "Mexico City",
                            state: "Mexico City",
                            zip: "01049")
    
shelter2 = Shelter.create(name: "Reptiles R Us",
                            address: "7566 Soda Springs Dr",
                            city: "Clearwater Beach",
                            state: "Florida",
                            zip: "33767")
                            
shelter3 = Shelter.create(name: "Avian Friends Rescue",
                            address: "9214 Luigia Lane",
                            city: "San Diego",
                            state: "California",
                            zip: "92109")
                            
pet1 = shelter1.pets.create(name: "Alphonso",
                            image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                            age: 3,
                            sex: "Male",
                            status: true,
                            description: "Pokey but sweet")
pet2 = shelter2.pets.create(name: "Craig",
                            image: "https://images.freeimages.com/images/large-previews/6f2/crocodile-1404500.jpg",
                            age: 48,
                            sex: "Male",
                            status: true,
                            description: "May eat your children...")
pet3 = shelter3.pets.create(name: "Karen",
                            image: "https://images.freeimages.com/images/large-previews/161/bird-1383764.jpg",
                            age: 7,
                            sex: "Female",
                            status: true,
                            description: "Will want to speak to a manager")
