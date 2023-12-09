function envia()
  global client;

  global entrada1 entrada2 entrada3 entrada4;
  global V Pplot Iplot Pplot2 Iplot2

  sim_cel12(entrada1, entrada2, entrada3, entrada4) % calcula os pontos
  sim_cel13(entrada1, entrada2, entrada3, entrada4)

  CV = V;
  CPplot = Pplot;
  CIplot = Iplot;
  CPplot2 = Pplot2;
  CIplot2 = Iplot2;
  #CPplot2 = Pplot;
  #CIplot2 = Iplot;

  disp(Pplot(1,5));
  disp(length(CV));

  for indice = 1:length(CV)
    disp(indice);

    % envia todas os pontos em uma mensagem que será interpretada no tago.io
    message = sprintf('[ { "variable": "payload", "value": "%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i,%i" } ]', CV(indice), CPplot(1,indice), CPplot(2,indice), CPplot(3,indice), CPplot(4,indice), CPplot(5,indice), CIplot(1,indice), CIplot(2,indice), CIplot(3,indice), CIplot(4,indice), CIplot(5,indice), CPplot2(1,indice), CPplot2(2,indice), CPplot2(3,indice), CPplot2(4,indice), CPplot2(5,indice), CIplot2(1,indice), CIplot2(2,indice), CIplot2(3,indice), CIplot2(4,indice), CIplot2(5,indice));

    disp(message);

    write(client, "answer", message);

    pause(0.3);
  end

endfunction
