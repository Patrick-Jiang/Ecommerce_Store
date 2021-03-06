# frozen_string_literal: true

require 'net/http'
require 'json'
require 'faker'

categories = %w[Cleansers Masks SkinCare Makeup BodyCare]
tags = ['Vegan', 'Cruelty Free', 'Organic', 'Chemical Free', 'Gluten Free', 'Non-GMO', 'Oil Free', 'Water Free']
ProductTag.destroy_all
Tag.destroy_all
Product.destroy_all
Category.destroy_all
Province.delete_all
Page.delete_all

Page.create(title: 'This is about page title', content: 'This is about page content')
Page.create(title: 'This is contact page title', content: 'This is contact page content')

Province.create(name: 'Alberta', pst_rate: 0, gst_rate: 5)
Province.create(name: 'British Columbia', pst_rate: 7, gst_rate: 5)
Province.create(name: 'Manitoba', pst_rate: 8, gst_rate: 5)
Province.create(name: 'New Brunswick', pst_rate: 10, gst_rate: 5, hst_rate: 15)
Province.create(name: 'Newfoundland and Labrador', pst_rate: 10, gst_rate: 5, hst_rate: 15)
Province.create(name: 'Northwest Territories', gst_rate: 5)
Province.create(name: 'Nova Scotia', pst_rate: 10, gst_rate: 5, hst_rate: 15)
Province.create(name: 'Nunavut', gst_rate: 5)
Province.create(name: 'Ontario', pst_rate: 8, gst_rate: 5, hst_rate: 13)
Province.create(name: 'Prince Edward Island', pst_rate: 10, gst_rate: 5, hst_rate: 15)
Province.create(name: 'Québec', pst_rate: 9.975, gst_rate: 5)
Province.create(name: 'Saskatchewan', pst_rate: 6, gst_rate: 5)
Province.create(name: 'Yukon', gst_rate: 5)

tags.each do |n|
  Tag.create(name: n)
end

categories.each do |n|
  Category.create(name: n)
end

url = 'https://raw.githubusercontent.com/Patrick-Jiang/The_Face_Shop_Web_Scrape/master/Outputs/bodycare.json'
uri = URI(url)
response = Net::HTTP.get(uri)
body_care = JSON.parse(response)
body_care.each do |key|
  product = Product.create(name: key[1]['name'],
                           description: key[1]['description'],
                           price: key[1]['price'].to_f,
                           image: key[1]['img_link'],
                           category_id: Category.where(name: 'BodyCare').first.id)

  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
end

url = 'https://raw.githubusercontent.com/Patrick-Jiang/The_Face_Shop_Web_Scrape/master/Outputs/cleansers.json'
uri = URI(url)
response = Net::HTTP.get(uri)
cleansers = JSON.parse(response)
cleansers.each do |key|
  product = Product.create(name: key[1]['name'],
                           description: key[1]['description'],
                           price: key[1]['price'].to_f,
                           image: key[1]['img_link'],
                           category_id: Category.where(name: 'Cleansers').first.id)

  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
end

url = 'https://raw.githubusercontent.com/Patrick-Jiang/The_Face_Shop_Web_Scrape/master/Outputs/makeups.json'
uri = URI(url)
response = Net::HTTP.get(uri)
makeups = JSON.parse(response)
makeups.each do |key|
  product = Product.create(name: key[1]['name'],
                           description: key[1]['description'],
                           price: key[1]['price'].to_f,
                           image: key[1]['img_link'],
                           category_id: Category.where(name: 'Makeup').first.id)

  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
end

url = 'https://raw.githubusercontent.com/Patrick-Jiang/The_Face_Shop_Web_Scrape/master/Outputs/masks.json'
uri = URI(url)
response = Net::HTTP.get(uri)
Masks = JSON.parse(response)
Masks.each do |key|
  product = Product.create(name: key[1]['name'],
                           description: key[1]['description'],
                           price: key[1]['price'].to_f,
                           image: key[1]['img_link'],
                           category_id: Category.where(name: 'Masks').first.id)

  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
end

url = 'https://raw.githubusercontent.com/Patrick-Jiang/The_Face_Shop_Web_Scrape/master/Outputs/skincare.json'
uri = URI(url)
response = Net::HTTP.get(uri)
SkinCares = JSON.parse(response)
SkinCares.each do |key|
  product = Product.create(name: key[1]['name'],
                           description: key[1]['description'],
                           price: key[1]['price'].to_f,
                           image: key[1]['img_link'],
                           category_id: Category.where(name: 'SkinCare').first.id)

  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
  ProductTag.create(product_id: product.id,
                    tag_id: Tag.all.sample(1).first.id)
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
