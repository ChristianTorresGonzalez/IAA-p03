practica = newfis('controlador-agua');

practica = addvar(practica, 'input', 'error', [-15, 15]);
practica = addvar(practica, 'output', 'apertura_entrada', [-25, 100]);

practica = addmf(practica, 'input', 1, 'Negativo', 'trapmf', [-20 -15 -10 0]);
practica = addmf(practica, 'input', 1, 'Cero', 'trimf', [-5 0 5]);
practica = addmf(practica, 'input', 1, 'Positivo', 'trapmf', [0 10 15 30]);
practica = addmf(practica, 'output', 1, 'Cerrar', 'trimf', [-25 0 25]);
practica = addmf(practica, 'output', 1, 'Abrir', 'trapmf', [0 50 100 150]);

plotmf(practica, 'input', 1);
plotmf(practica, 'output', 1);

practica = addrule(practica, [1 1 1 1 ; 2 1 1 1 ; 3 2 1 1]);
showrule(practica);

altura_actual = 19;
altura_deseada = 20;
error = altura_deseada - altura_actual;
lado = 10;
base = lado * lado;

output = evalfis(error, practica)
porcentaje_real = ((0.4 * output) / 100) - 0.1

altura_final = altura_actual - (porcentaje_real / base)