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

  //obj1 = {"owners":[{"ID_OWNER":"2","NAME":"Jose Villa"},{"ID_OWNER":"3","NAME":"Metztli Alonso"},{"ID_OWNER":"4","NAME":"Eduardo Sanchez"},{"ID_OWNER":"5","NAME":"Axl Lopez"},{"ID_OWNER":"6","NAME":"Oscar Meza"},{"ID_OWNER":"7","NAME":"Magali Lopez"}],"causes":[{"ID_CAUSE":"1","CAUSE":"Capacitacion"},{"ID_CAUSE":"2","CAUSE":"Documentacion"},{"ID_CAUSE":"3","CAUSE":"Error humano"}],"queues":[]}
  obj1 = {"owners":[{"ID_OWNER":"6","NAME":"Jose Villa"},{"ID_OWNER":"7","NAME":"Metztli Alonso"},{"ID_OWNER":"8","NAME":"Eduardo Sanchez"},{"ID_OWNER":"9","NAME":"Axl Lopez"},{"ID_OWNER":"10","NAME":"Oscar Meza"},{"ID_OWNER":"11","NAME":"Magali Lopez"}],"causes":[{"ID_CAUSE":"1","CAUSE":"Capacitacion"},{"ID_CAUSE":"2","CAUSE":"Documentacion"},{"ID_CAUSE":"3","CAUSE":"Error humano"}],"queues":[{"ID_queues":"5","QUEUES":"AMX-Portales Comerciales"},{"ID_queues":"8","QUEUES":"AMX-GI-Administracion-Interna"},{"ID_queues":"9","QUEUES":"AMX-Capacitacion"},{"ID_queues":"10","QUEUES":"AMX-Portales Comerciales::amx-casos"},{"ID_queues":"11","QUEUES":"AMX-Portales Comerciales::Ecuador"},{"ID_queues":"12","QUEUES":"AMX-Intermediacion-Terceros"},{"ID_queues":"14","QUEUES":"AMX-Claroshop"},{"ID_queues":"15","QUEUES":"AMX-SelfService-Colombia"},{"ID_queues":"16","QUEUES":"AMX-UNOTV"},{"ID_queues":"17","QUEUES":"AMX-Proyectos Generales-TyP"},{"ID_queues":"18","QUEUES":"AMX-Intermediacion-Terceros::amx-triara-fw"},{"ID_queues":"20","QUEUES":"AMX-eCommerce"},{"ID_queues":"21","QUEUES":"AMX-Portales-Cloud"},{"ID_queues":"22","QUEUES":"AMX-SelfService-Chile"},{"ID_queues":"23","QUEUES":"AMX-SelfService-CENAM"},{"ID_queues":"24","QUEUES":"AMX-Portales Comerciales::ClaroPeru"},{"ID_queues":"25","QUEUES":"AMX-Portales Comerciales::ClaroChile"},{"ID_queues":"26","QUEUES":"AMX-Portales Comerciales::amx-ssgt"},{"ID_queues":"27","QUEUES":"AMX-ClaroPagos"},{"ID_queues":"28","QUEUES":"AMX-Sears-Legacy"},{"ID_queues":"29","QUEUES":"AMX-ClaroMusica-dla"},{"ID_queues":"32","QUEUES":"AMX-USA"},{"ID_queues":"33","QUEUES":"AMX-Claroshop::amx-arladm"}]}
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
      que += "<option value=" + obj1.queues[key].ID_queues  + ">" +obj1.queues[key].QUEUES + "</option>"
      
  }
  document.getElementById("queues").innerHTML = que;
  document.getElementById("queues").selectedIndex = -1;

  window.addEventListener("load", function() {
    Form.tick.addEventListener("keypress", soloNumeros, false);
    Form.comm.addEventListener("keypress", alfanum, false);
  });

  function soloNumeros(e){
    var key = window.event ? e.which : e.keyCode;
    if (key < 48 || key > 57) {
      e.preventDefault();
    }
  }

  function alfanum(e){
    var key = window.event ? e.which : e.keyCode;
    if (key < 48 || key > 57) {
      e.preventDefault();
    }
  }