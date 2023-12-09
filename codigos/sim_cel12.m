function sim_cel12(I_SC, Vdc, Vmp, TC)

  global V Iplot Pplot

  % variaveis
  q = 1.60217662 * (10^(-19)); % elementary charge
  k = 1.38064852 * (10^(-23));  % Boltzmanns constant
  n = 1.4;      % ideality factor

  T = 298.15;       % temperatura da celula (KELVIN)
  I_r = 200:200:1000    % input de irradiancia

  % V = linspace(0,Vmp/Vdc);    % usando tensão como variável de entrada
  V = linspace(0, Vmp/Vdc, 35);

  T_0 = 298.15;       % temp de referencia = 25C
  I_r0 = 1000       % irradiancia de referencia
  V_OC = 0.721;     % v ref

  V_g = 1.79*(10^(-19));  % band gap em joules
  [V_m,I_rm] = meshgrid(V,I_r);    % criando a meshgrid
  I_s0 = 1.2799*(10^-8);       % corrente de saturação na temperatura de referencia (equacao encontrada no artigo referenciado)
  I_ph = ((I_SC/I_r0).*I_rm).*(1+ TC*(T-T_0));  % equacao de fotocorrente (encontrada no artigo referenciado)
  I_s = I_s0.*(T./T_0).^(3/n).*exp((-(q*V_g)/n*k).*((1./T)-(1/T_0)));  % corrente de saturacao (artigo referenciado)
  I = I_ph - I_s.*exp(((q*V_m)/(n*k*T))-1);   % equacao corrente
  P = I.*V;


  Iplot=I;
  Iplot(Iplot<0)=nan; % evitando valores incondizentes
  Pplot = P;
  Pplot(Pplot<0)=nan;

  figure(1);
  plot(V,Iplot);
  xlabel('Tensão (V)');
  ylabel('Corrente (I)');
  grid on;

  figure(2);
  plot(V,Pplot);
  xlabel('Tensão (V)');
  ylabel('Potência (P)');
  grid on;

endfunction
