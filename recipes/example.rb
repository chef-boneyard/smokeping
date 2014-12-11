include_recipe "smokeping"

# Instead of having code for Chef Solo, use Chef Local mode instead
# to support Search
#servers = search(:nodes, 'recipe:smokeping::master*')

group = [{
  "name" => "Production",
  "nodes" => ["node1","node2"],
  "slaves" => ["node1","node2"]
}]

group.each do |i|
  smokeping_target i['name'] do
    action :create
    data [i]
  end
end
