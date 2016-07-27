json.item @item
json.owner do
  json.extract! current_user, :id, :username, :first_name, :last_name
end
