namespace :create_seed_data_store do
  desc "Creates the seed data for the Store model"
  task create_stores: :environment do
    Store.delete_all
    
    Store.create!([
      {
        name: 'Colsubsidio',
        logo_url: 'https://7212050.fs1.hubspotusercontent-na1.net/hubfs/7212050/Sitio%20.COM/new-content/nuevo-logo-colsubsidio-2021.svg'
      },
      {
        name: 'Olimpica',
        logo_url: 'https://olimpica.vtexassets.com/arquivos/header_logo_olimpica.svg'
      },
      {
        name: 'Exito',
        logo_url: 'https://exitocol.vtexassets.com/assets/vtex.file-manager-graphql/images/d34d990a-6e51-438f-b163-438438a97a6e___50dc4199e8020554de79a91123175966.svg'
      },
      {
        name: 'Jumbo',
        logo_url: 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Logo_Jumbo_Cencosud.png'
      },
      {
        name:'Alkosto',
        logo_url: 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Logo_alkosto.JPG'
      },
      {
        name: 'Comunal',
        logo_url: 'https://supertiendascomunal.com/img/supertiendas-comunal-logo-1641943639.jpg'
      },
      {
        name: 'D1',
        logo_url: 'https://d1.com.co/wp-content/uploads/logo_corp.jpg'
      },
      {
        name: 'Don Vidal',
        logo_url: 'https://media.istockphoto.com/vectors/grocery-purchase-shopping-trolley-cart-full-products-foods-and-drinks-vector-id1226287622?s=170667a'
      },
      {
        name:'Fruvar',
        logo_url: 'https://todocedritos.com/servicio_domicilio_supermercado_barrio_cedritos_bogota/domicilios_supermercados_fruvar_barrio_cedritos_norte_bogota_frutas_verduras_0.jpg'
      }
    ])
    puts "Created #{Store.count} stores"
  end

end
