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