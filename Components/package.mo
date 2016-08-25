within ActiveNet;

package Components
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

  model Ground
    ActiveNet.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    p.v.re = 0;
    p.v.im = 0;
    annotation(Icon(graphics = {Polygon(origin = {0, -19.85}, lineColor = {0, 128, 128}, points = {{-40, 19.8536}, {40, 19.8536}, {0, -20.1464}, {-40, 19.8536}}), Line(origin = {0, 10}, points = {{0, -10}, {0, 10}}, color = {0, 128, 128})}));
  end Ground;
end Components;