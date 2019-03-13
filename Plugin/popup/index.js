function valida(f) {
    var ok = true;
    var msg = "Campos vacíos:\n\n";
    if(f.id_own.value == "")
    {
      msg += "Ticket Owner\n";
      ok = false;
    }
    if(f.Ticket.value == "")
    {
      msg += "Ticket ID\n";
      ok = false;
    }
    if(f.que.value == "")
    {
      msg += "Queues\n";
      ok = false;
    }
    if(f.cau.value == "")
    {
      msg += "Motivo\n";
      ok = false;
    }
    if(f.comments.value == "")
    {
      msg += "Comentarios\n";
      ok = false;
    }
  
    if(ok == false)
      alert(msg);
    else  
      alert("Todo chido :)");
    return ok;
  }


  //$.post('http://api.jablab.ctin.xyz/plugin-select.php',{}, function(jsonData) {alert(jsonData); jsonparaform = jsonData;} );
  //$.getJSON( "http://api.jablab.ctin.xyz/plugin-select.php", function(jsonparaform) {
  $.getJSON( "http://anubis.amxdigital.net/test/plugin-select.php", function(jsonparaform) {

    own = "";
    for(var key in jsonparaform.owners) {
      own += "<option id=" + jsonparaform.owners[key].ID_OWNER + " value=" + " \"" + jsonparaform.owners[key].NAME + "\" " +  ">" + jsonparaform.owners[key].NAME + "</option>"
      
    }
    document.getElementById("id_Owner").innerHTML = own;
    document.getElementById("id_Owner").selectedIndex = -1;
  
    cause = "";
    for(var key in jsonparaform.causes) {
        cause += "<option id=" + jsonparaform.causes[key].ID_CAUSE + " value=" + jsonparaform.causes[key].CAUSE + " >" + jsonparaform.causes[key].CAUSE + "</option>"
        
    }
    document.getElementById("cause").innerHTML = cause;
    document.getElementById("cause").selectedIndex = -1;
  
    que = "";
    for(var key in jsonparaform.queues) {
        que += "<option id=" + jsonparaform.queues[key].ID_queues + " value=" + jsonparaform.queues[key].QUEUES  + " >" + jsonparaform.queues[key].QUEUES + "</option>"
        
    }
    document.getElementById("queues").innerHTML = que;
    document.getElementById("queues").selectedIndex = -1;

  });

  window.addEventListener("load", function() {
    //f.tick.addEventListener("keypress", soloNumeros, false);
    //Form.comm.addEventListener("keypress", alfanum, false);
  });

  function soloNumeros(e){
    var key = window.event ? e.which : e.keyCode;
    if (key < 48 || key > 57) {
      e.preventDefault();
    }
  }