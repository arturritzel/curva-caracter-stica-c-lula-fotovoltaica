function recebemessage(t,v) % recebe mensagem via mqtt
  printf("Topic: %s / Message: %s\n", t, v);

  global entrada1 entrada2 entrada3 entrada4;

  parts = strsplit(v, ':');
    if numel(parts) == 2
        variav = strtrim(parts{1});
        value = str2double(strtrim(parts{2}));

        % atualiza a variavel de entrada
        switch variav
            case 'entrada1'
                entrada1 = value;
            case 'entrada2'
                entrada2 = value;
            case 'entrada3'
                entrada3 = value;
            case 'entrada4'
                entrada4 = value;
            otherwise
                fprintf('recebido: %s\n', variav);
        end
    end

    checagem();

endfunction
