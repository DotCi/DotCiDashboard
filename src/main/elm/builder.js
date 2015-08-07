import Builder from './Builder.elm'
require('./grid.css');
export default function builder(){

  var gridster = window.$(".gridster > ul").gridster({
    widget_margins: [5, 5],
    widget_base_dimensions: [100, 55],
    autogrow_cols: true,
    resize: {
      enabled: true
    },
    serialize_params($w, wgd) {
      const project = $w.get(0).getAttribute("data-project")
      const org = $w.get(0).getAttribute("data-org")
      return { project,org, col: wgd.col, row: wgd.row, size_x: wgd.size_x, size_y: wgd.size_y }
    }

  }).data('gridster');




  const main = document.getElementById("main");
  const App = Builder.embed(Builder.Main, main, {});
  App.ports.addProject.subscribe(function(project) {
    gridster.add_widget.apply(gridster, [`<li data-org="${project.org}" data-project="${project.name}">${project.name}</li>`, 2, 1])
  });

  window.$("#save-dashboard").click(()=>{
    const gridData = gridster.serialize();
    const data = JSON.stringify(gridData);
    var name = prompt("View Name", "");
    qwest.post(rootURL+ "/dotciDashboard/createView", {data,name}).then(function(xhr, response,k){
      window.location = window.rootURL + '/dotCiDashBoardView/'+ name;
    })
  })
}
