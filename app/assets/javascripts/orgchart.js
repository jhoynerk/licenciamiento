var labelType, useGradients, nativeTextSupport, animate;

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

var Log = {
  elem: false,
  write: function(text){
    if (!this.elem)
      this.elem = document.getElementById('log');
    this.elem.innerHTML = text;
    this.elem.style.left = (500 - this.elem.offsetWidth / 2) + 'px';
  }
};

nodeHeight = 158;
nodeWidth = 139;
rowSpaceing = 30;
function init(json){
    //init data
    //init Spacetree
    //Create a new ST instance
    st = new $jit.ST({
        //id of viz container element
        injectInto: 'infovis',
        //set duration for the animation
        duration: 400,
        //set animation transition type
        transition: $jit.Trans.Sine.easeInOut,
        //set distance between node and its children
        orientation:'top',
        levelDistance: rowSpaceing,
        levelsToShow: 1,
        constrained: false,
        //enable panning
        Navigation: {
          enable:true,
          panning:'avoid nodes',
          zooming: (csstransform != false) ? 10 : false
        },

        Events: {
          enable: true,
          onMouseWheel: function(delta, e) {
            $('#infovis-label .node').each(function(){
              this.style[csstransform] = "scale("+st.canvas.scaleOffsetX+")";
            });
            //zoomPercent = Math.round(st.canvas.scaleOffsetX*100);
            //Log.write("zoom "+zoomPercent+'%');
          }
        },

        //set node and edge styles
        //set overridable=true for styling individual
        //nodes or edges
        Node: {
          height: nodeHeight,
          width: nodeWidth,
          type: 'roundrect',
          color: '#1ab394',
          overridable: true
        },
        Edge: {
          type: 'bezier',
          lineWidth: 3,
          color:'#00C39C',
          overridable: true
        },

        onBeforeCompute: function(node){

        },

        onAfterCompute: function(){

        },

        //This method is called on DOM label creation.
        //Use this method to add event handlers and styles to
        //your node.
        onCreateLabel: function(label, node){
            label.id = node.id;
            label.innerHTML = "<a href='/employees/"+node.id+"'<i class='pull-right text-navy fa fa-eye' style='font-size:14px' alt='Profile'></i></a><div class='clearfix'></div><img style='margin-top:5px' class='img-circle' src='"+node.data.photo+"' height='65' /><br><strong>"+node.name+"</strong><br><span>"+node.data.workstation+"</span>";
            label.onclick = function(){
              st.onClick(node.id);
            };
            //set label styles
            var style = label.style;
            style.width = nodeWidth - 6 + 'px';
            style.height = nodeHeight - 6 + 'px';
            style.cursor = 'pointer';
            style.color = '#fff';
            style.fontSize = '0.9em';
            style.textAlign= 'center';
            style.padding = '3px';
            style.margin = '3px 0px 0px 3px';
        },
        onPlaceLabel: function(label, node) {
          var style = label.style;
          style.color = '#000';
          if (node.selected ) {
            style.backgroundColor = "#D0F7EF";
          }else{
            style.backgroundColor = "#fff";
          }
        },

        onAfterPlotNode: function(node){
          var elm = $jit.id(node.id);
          if(elm){
            if (node.selected ) {
              $jit.id(node.id).style.backgroundColor = "#39B39A";
              $jit.id(node.id).style.borderColor = "#39B39A";
            }else {
              $jit.id(node.id).style.backgroundColor = "";
              $jit.id(node.id).style.borderColor = "";
            }
          }
        },

        //This method is called right before plotting
        //a node. It's useful for changing an individual node
        //style properties before plotting it.
        //The data properties prefixed with a dollar
        //sign will override the global node style properties.
        onBeforePlotNode: function(node){
            //add some color to the nodes in the path between the
            //root node and the selected node.
            if (node.selected) {
              node.data.$color = "#39B39A";
            }
            else {
              node.data.$color = "#39B39A";
            }
        },

        //This method is called right before plotting
        //an edge. It's useful for changing an individual edge
        //style properties before plotting it.
        //Edge data proprties prefixed with a dollar sign will
        //override the Edge global style properties.
        onBeforePlotLine: function(adj){
          if (adj.nodeFrom.selected && adj.nodeTo.selected) {
            adj.data.$color = "#ed5565";
            adj.data.$lineWidth = 3;
          }else {
            delete adj.data.$color;
            delete adj.data.$lineWidth;
          }
        }
    });
    //load json data
    st.loadJSON(json);
    //compute node positions and layout
    st.compute();
    //optional: make a translation of the tree
    st.geom.translate(new $jit.Complex(-200, 0), "current");
    //emulate a click on the root node.
    st.onClick(st.root);
    //end;
    //end
    $jit.ST.Plot.NodeTypes.implement({
      'roundrect': {
        'render': function(node, canvas, animating) {
                var pos = node.pos.getc(true), nconfig = this.node, data = node.data;
                var width  = nconfig.width, height = nconfig.height;
                var algnPos = this.getAlignedPos(pos, width, height);
                var ctx = canvas.getCtx(), ort = this.config.orientation;
                ctx.beginPath();

                      var r = 4; //corner radius
                      var x = algnPos.x;
                      var y = algnPos.y;
                      var h = height;
                      var w = width;

                      ctx.moveTo(x + r, y);
                      ctx.lineTo(x + w - r, y);
                      ctx.quadraticCurveTo(x + w, y, x + w, y + r);
                      ctx.lineTo(x + w, y + h - r);
                      ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h);
                      ctx.lineTo(x + r, y + h);
                      ctx.quadraticCurveTo(x, y + h, x, y + h - r);
                      ctx.lineTo(x, y + r);
                      ctx.quadraticCurveTo(x, y, x + r, y);
                      ctx.fill();
        }
      }
    });

}

$(function(){
  $.get('/employees/organization-hash.json', function(data){
    csstransform=getsupportedprop(['transform', 'MozTransform', 'WebkitTransform', 'msTransform', 'OTransform']);
    init(data);
  });

  $("#zoomIn").on('click', function(e) {
    e.preventDefault();
    st.canvas.scale(1.1, 1.1);
    $('#infovis-label .node').each(function(){
      this.style[csstransform] = "scale("+st.canvas.scaleOffsetX+")";
    });
    //var zPercent = Math.round(st.canvas.scaleOffsetX*100);
  });

  $("#zoomOut").on('click', function(e) {
    e.preventDefault();
    st.canvas.scale(.909, .909);
    $('#infovis-label .node').each(function(){
      this.style[csstransform] = "scale("+st.canvas.scaleOffsetX+")";
    });
    //var zPercent = Math.round(st.canvas.scaleOffsetX*100);
  });

  $('#all').on('click', function(e){
    e.preventDefault();
    st.config.levelsToShow = 100;
    st.config.constrained = false;
    $('#'+st.clickedNode.id).click();
  });

  $('#contract').on('click', function(e){
    e.preventDefault();
    st.config.levelsToShow = 1;
    st.config.constrained = true;
    $('#'+st.clickedNode.id).click();
  });

});

function getsupportedprop(proparray){
  var root=document.documentElement
  for (var i=0; i<proparray.length; i++){
    if (typeof root.style[proparray[i]]=="string"){
      return proparray[i]
    }
  }
  return false;
}
