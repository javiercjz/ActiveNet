within ActiveNet.Components;

model ComplexImpedance
  parameter Modelica.SIunits.Impedance R "Resistance";
  parameter Modelica.SIunits.Impedance X "Reactance";
  Modelica.SIunits.ComplexImpedance Z "Complex Impedance";
  extends ActiveNet.Connectors.OnePort;
equation
  Z.re = R;
  Z.im = X;
  v = Z * i;
  annotation(Icon(graphics = {Rectangle(lineColor = {0, 128, 128}, extent = {{-80, 40}, {80, -40}}), Text(origin = {0, 1}, lineColor = {0, 128, 128}, extent = {{-68, 33}, {68, -33}}, textString = "Z", fontName = "DejaVu Sans Mono")}));
end ComplexImpedance;