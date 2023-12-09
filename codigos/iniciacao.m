pkg load mqtt

% conectando ao broker mqtt
global client;
client = mqttclient('mqtt.tago.io', 'Port', 1883, 'Username', 'Token', 'Password', 'insira-seu-token');

% inscrever-se caso queira receber as proprias mensagens enviadas
%subs = subscribe(client, "answer", "Callback", @recebemessage);

subs = subscribe(client, "request", "Callback", @recebemessage);

global entrada1;
entrada1 = -99;
global entrada2;
entrada2 = -99;
global entrada3;
entrada3 = -99;
global entrada4;
entrada4 = -99;

global Iplot;
global Pplot;
global V;
global Iplot2;
global Pplot2;
