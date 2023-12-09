function checagem % verifica se já possui todas as variáveis necessárias para calcular os pontos

  global entrada1 entrada2 entrada3 entrada4;

    if(entrada1 != -99 && entrada2 != -99 && entrada3 != -99 && entrada4 != -99)

      spama2()

      entrada1 = -99;
      entrada2 = -99;
      entrada3 = -99;
      entrada4 = -99;

    end

endfunction
