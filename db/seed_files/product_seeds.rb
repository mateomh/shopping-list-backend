# SEED DATA FOR THE PRODUCT MODEL
# {
#   name: '',
#   quantity: '',
#   description: '',
#   image_url: '',
#   category_id: getCategoryId('')
# },


Product.create!([
  {
    name: 'Axion Loza Limon',
    quantity: '1500ml',
    description: 'Lavaloza Axion',
    image_url: '',
    category_id: getCategoryId('Aseo')
  },
])

def getCategoryId(category_name)
  return Category.where(name: category_name).id
end