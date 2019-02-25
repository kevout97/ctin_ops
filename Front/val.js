function valida(f) {
    var ok = true;
    var msg = "Campos vacíos:\n\n";
    if(f.id_Owner.value == "")
    {
      msg += "Ticket Owner\n";
      ok = false;
    }
    if(f.Ticket.value == "")
    {
      msg += "Ticket ID\n";
      ok = false;
    }
    if(f.queues.value == "")
    {
      msg += "Queues\n";
      ok = false;
    }
    if(f.cause.value == "")
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
      //enviar formulario
    return ok;
  }

  obj1 = {"owners":[{"ID_OWNER":"2","NAME":"Jose Villa"},{"ID_OWNER":"3","NAME":"Metztli Alonso"},{"ID_OWNER":"4","NAME":"Eduardo Sanchez"},{"ID_OWNER":"5","NAME":"Axl Lopez"},{"ID_OWNER":"6","NAME":"Oscar Meza"},{"ID_OWNER":"7","NAME":"Magali Lopez"}],"causes":[{"ID_CAUSE":"1","CAUSE":"Capacitacion"},{"ID_CAUSE":"2","CAUSE":"Documentacion"},{"ID_CAUSE":"3","CAUSE":"Error humano"}],"queues":[]}
  own = "";
  for(var key in obj1.owners) {
      own += "<option value=" + obj1.owners[key].ID_OWNER  + ">" +obj1.owners[key].NAME + "</option>"
      
  }
  document.getElementById("id_Owner").innerHTML = own;
  document.getElementById("id_Owner").selectedIndex = -1;

  cause = "";
  for(var key in obj1.causes) {
      cause += "<option value=" + obj1.causes[key].ID_CAUSE  + ">" +obj1.causes[key].CAUSE + "</option>"
      
  }
  document.getElementById("cause").innerHTML = cause;
  document.getElementById("cause").selectedIndex = -1;

  que = "";
  for(var key in obj1.queues) {
      que += "<option value=" + obj1.owners[key].ID_OWNER  + ">" +obj1.owners[key].NAME + "</option>"
      
  }
  document.getElementById("queues").innerHTML = que;
  document.getElementById("queues").selectedIndex = -1;

  window.addEventListener("load", function() {
    Form.tick.addEventListener("keypress", soloNumeros, false);
  });

  function soloNumeros(e){
    var key = window.event ? e.which : e.keyCode;
    if (key < 48 || key > 57) {
      e.preventDefault();
    }
  }