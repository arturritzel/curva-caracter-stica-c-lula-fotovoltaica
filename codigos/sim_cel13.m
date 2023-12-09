function sim_cel13(I_SC, Vdc, Vmp, TC)

  global V Pplot2 Iplot2;

  q = 1.60217662 * (10^(-19));
  k = 1.38064852 * (10^(-23));
  n = 1.4;

  I_r = 800; % irradiância fixa nessa função

  % V = linspace(0,Vmp/Vdc);    % usando tensão como variável de entrada
  V = linspace(0, Vmp/Vdc, 35);

  T_0 = 298.15;
  V_OC = 0.721;
  V_g = 1.79*(10^(-19));

  % varia a temperatura(T) de 298.15 K para 338.15 K em degraus de 10 K
  temperatures = 298.15:10:338.15;

  Iplot2 = zeros(length(temperatures), length(V));
  Pplot2 = zeros(length(temperatures), length(V));

  for i = 1:length(temperatures)
    T = temperatures(i);
    I_s0 = 1.2799*(10^-8);
    I_ph = ((I_SC/I_r).*I_r).*(1 + TC*(T - T_0));
    I_s = I_s0.*(T./T_0).^(3/n).*exp((-(q*V_g)/n*k).*((1./T)-(1/T_0)));
    I = I_ph - I_s.*exp(((q*V)/(n*k*T)) - 1);
    P = I.*V;

    Iplot3 = I;
    Iplot3(Iplot3 < 0) = nan;
    Pplot3 = P;
    Pplot3(Pplot3 < 0) = nan;

    Iplot2(i, :) = Iplot3;
    Pplot2(i, :) = Pplot3;
  end

  % plotando todas as curvas juntas
  figure(3);
  plot(V, Iplot2);
  xlabel('Tensão (V)');
  ylabel('Corrente (I)');
  title('Variação da Corrente com a Temperatura');
  legend(arrayfun(@(T) ['T = ' num2str(T) ' K'], temperatures, ' ', false));
  grid on;

  figure(4);
  plot(V, Pplot2);
  xlabel('Tensão (V)');
  ylabel('Potência (P)');
  title('Variação da Potência com a Temperatura');
  legend(arrayfun(@(T) ['T = ' num2str(T) ' K'], temperatures, ' ', false));
  grid on;

end
