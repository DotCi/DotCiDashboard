import qwest from 'qwest';
export default function(){
  qwest.get(window.location.pathname+"/api").then((response) =>{
    buildGrid(JSON.parse(response.configuration));
  });

}

function buildGrid(configuration){
  var gridster = window.$(".gridster > ul").gridster({
    widget_margins: [5, 5],
    widget_base_dimensions: [100, 55],
    autogrow_cols: true,
    resize: {
      enabled: true
    }
  }).data('gridster');


  gridster.remove_all_widgets();
  $.each(configuration, function() {
    gridster.add_widget('<li />', this.size_x, this.size_y, this.col, this.row);
  });
}
