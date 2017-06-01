require 'rails_helper'

describe "items api" do
  it "can return a list of items" do
    create_list(:item, 4)

    get "/api/v1/items"

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)
    expect(items.first).to have_key("name")
    expect(items.first).to have_key("description")
    expect(items.first).to have_key("image_url")
    expect(items.first).to_not have_key("created_at")
    expect(items.first).to_not have_key("updated_at")
  end

  it "can return a single item by its id" do
    item1 = create(:item)
    item2 = create(:item)

    get "/api/v1/items/#{item1.id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.code).to eq("200")
    expect(item["id"]).to eq(item1.id)
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("image_url")
    expect(item).to_not have_key("created_at")
    expect(item).to_not have_key("updated_at")
  end

  it "can create an item" do
    post "/api/v1/items?name=Guitar&description=Pretty&image_url=https://www.taylorguitars.com/sites/default/files/styles/multi_column_guitar_three/public/responsive-guitar-detail/Taylor-524ce-fr-2016.png?itok=ENjzoiOl"

    expect(response.code).to eq("201")

    item = JSON.parse(response.body)


    expect(item).to be_a(Hash)
    expect(item["item"]["name"]).to eq("Guitar")
    expect(item["item"]).to have_key("description")
    expect(item["item"]).to have_key("image_url")
    expect(item["item"]).to_not have_key("created_at")
    expect(item["item"]).to_not have_key("updated_at")
  end

  it "can delete an item" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    expect(Item.count).to eq(3)

    delete "/api/v1/items/#{item1.id}"

    expect(response.code).to eq("204")
    expect(Item.count).to eq(2)
    expect{ Item.find(item1.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
