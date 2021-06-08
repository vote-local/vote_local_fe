<div class="card flex-md-row mb-4 box-shadow h-md-50">
  <div class="card-body d-flex flex-column align-items-start">
    <strong class="d-inline-block mb-2 text-primary"><%= @representative.office) %></strong>
<img class="card-img-right flex-auto d-none d-md-block" data-src="holder.js/200x250?theme=thumb" alt=""<%="#{@representative.name}'s photo"%>" style="width: 200px; height: 250px;" src="<%= "#{@representative.photo_url}"%>" data-holder-rendered="true">

<div class="col-lg-4">
            <h2><%= @representative.name %></h2>
            <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
            <p><a class="btn btn-secondary" href="#" role="button">View Twitter »</a></p>
          </div>
