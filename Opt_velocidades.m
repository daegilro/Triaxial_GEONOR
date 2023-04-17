clear all
clc

n_1 = [24,33,34,40,46,47,50,60,63,71,72,82,96]; %Numero de dientes.(Entrada)
n_3 = [24,33,34,40,46,47,50,60,63,71,72,82,96]; %Numero de dientes. (Salida)
w_1 = 0.897;%Velocidad angular en rad/s(Entrada)
V_s = 0.6; %Velocidad salida mm/ min (Salida) (VARIAR)
s = length(n_1); % Variable auxiliar
h=10;% Variable auxiliar
ei = 0.1; % Valor de error (VARIAR)
l = 1; % Variable auxiliar
m = 1; % Variable auxiliar
g = 1; % Variable auxiliar
p = 1; % Variable auxiliar
for c = 1:s
    for r = 1:s
        w_3s(r,c) = (w_1.*n_1(c))./(n_3(r));
    end
end

w_4 = w_3s./4;
r_4 = 0.02; % Correlacion de radio mm, para determinar v lineal.
V_f = w_4.*60*r_4;

V_m1 = min(V_f);

V_m2 = max(V_f);

    while  h > ei 
for i = m
    for j = 1:s
        h(i,j) = abs(V_f(i,j)-V_s);
    end
    m  = i+1;
end
    end
    
    
    while  g > ei
    for j = p
        g(j) = abs(V_f(i,j)-V_s);
        p=j+1;
    end
     end


  %Numero de dientes para engranaje optimo para la entrada (n_1)
  Engranaje_n_1  = n_1(j) % Numero de dientes.
  %Numero de dientes para engranaje optimo para la salida (n_3)
  Engranaje_n_3  = n_3(i) % Numero de dientes.
  %Velocidad minima que se puede logar en el sistema. 
  V_min = min(V_m1) % Unidades en mm/min
  %Velocidad maxima que se puede logar en el sistema. 
  V_max = max(V_m2) %Unidades en mm / min.
