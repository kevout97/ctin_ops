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
    return ok;
  }

  obj1 = {"owners":[{"ID_OWNER":"2","NAME":"Jose Villa"},{"ID_OWNER":"3","NAME":"Metztli Alonso"},{"ID_OWNER":"4","NAME":"Eduardo Sanchez"},{"ID_OWNER":"5","NAME":"Axl Lopez"},{"ID_OWNER":"6","NAME":"Oscar Meza"},{"ID_OWNER":"7","NAME":"Magali Lopez"}],"causes":[{"ID_CAUSE":"1","CAUSE":"Capacitacion"},{"ID_CAUSE":"2","CAUSE":"Documentacion"},{"ID_CAUSE":"3","CAUSE":"Error humano"}],"queues":[]}
  html = "";
  for(var key in obj1.owners) {
      html += "<option value=" + obj1.owners[key].ID_OWNER  + ">" +obj1.owners[key].NAME + "</option>"
      
  }
  document.getElementById("id_Owner").innerHTML = html;
  document.getElementById("id_Owner").selectedIndex = -1;




  