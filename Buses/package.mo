within ActiveNet;

package Buses
  model Distribution_Lines_3p
    extends Connectors.ThreePort;
    parameter Modelica.SIunits.Length L "Cable Length";
    parameter Modelica.SIunits.Resistivity Rl "Resistance per Unit Length";
    parameter Modelica.SIunits.Permittivity Xl "Reactance per Unit Length";
    Modelica.SIunits.ComplexImpedance Z "Line Impedance";
  equation
    Z.re = Rl * L;
    Z.im = Xl * L;
    v1 = Z * i1;
    v2 = Z * i2;
    v3 = Z * i3;
    annotation(Icon(graphics = {Rectangle(origin = {0, -6}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-80, 26}, {80, -14}}), Rectangle(origin = {0, 64}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-80, 26}, {80, -14}}), Rectangle(origin = {0, -76}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-80, 26}, {80, -14}})}, coordinateSystem(initialScale = 0.1)));
  end Distribution_Lines_3p;

  model Dist_Line_1p
    parameter Modelica.SIunits.Length L "Cable Length";
    parameter Modelica.SIunits.Resistivity Rl "Resistance per unit length";
    parameter Modelica.SIunits.Permittivity Xl "Reactance per unit length";
    ActiveNet.Connectors.PositivePin p annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Connectors.NegativePin n annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.ComplexImpedance complexImpedance(R = Rl * L, X = Xl * L) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  equation
    connect(complexImpedance.n, n) annotation(Line(points = {{10, 0}, {92, 0}, {92, 0}, {90, 0}}, color = {0, 128, 128}));
    connect(complexImpedance.p, p) annotation(Line(points = {{-10, 0}, {-88, 0}, {-88, 0}, {-90, 0}}, color = {0, 128, 128}));
    annotation(Icon(graphics = {Rectangle(lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-78, 10}, {78, -10}})}));
  end Dist_Line_1p;

  model Dist_Line_3p
    parameter Modelica.SIunits.Length L "Cable Length";
    parameter Modelica.SIunits.Resistivity Rl "Resistance per unit length";
    parameter Modelica.SIunits.Permittivity Xl "Reactance per unit length";
    Dist_Line_1p dist_Line_1p1(L = L, Rl = Rl, Xl = Xl) annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Dist_Line_1p dist_Line_1p2(L = L, Rl = Rl, Xl = Xl) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Dist_Line_1p dist_Line_1p3(L = L, Rl = Rl, Xl = Xl) annotation(Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin p1 annotation(Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin p2 annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin p3 annotation(Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.NegativePin n1 annotation(Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.NegativePin n2 annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.NegativePin n3 annotation(Placement(visible = true, transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(dist_Line_1p3.n1, n3) annotation(Line(points = {{10, -70}, {94, -70}, {94, -70}, {90, -70}}, color = {0, 128, 128}));
    connect(p3, dist_Line_1p3.p1) annotation(Line(points = {{-90, -70}, {-8, -70}, {-8, -70}, {-8, -70}}, color = {0, 128, 128}));
    connect(dist_Line_1p2.n1, n2) annotation(Line(points = {{10, 0}, {92, 0}, {92, 0}, {90, 0}}, color = {0, 128, 128}));
    connect(p2, dist_Line_1p2.p1) annotation(Line(points = {{-90, 0}, {-10, 0}, {-10, 0}, {-8, 0}}, color = {0, 128, 128}));
    connect(dist_Line_1p1.n1, n1) annotation(Line(points = {{10, 70}, {90, 70}, {90, 70}, {90, 70}}, color = {0, 128, 128}));
    connect(p1, dist_Line_1p1.p1) annotation(Line(points = {{-90, 70}, {-8, 70}, {-8, 70}, {-8, 70}}, color = {0, 128, 128}));
    annotation(Icon(graphics = {Rectangle(origin = {0, -70}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-78, 10}, {78, -10}}), Rectangle(lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-78, 10}, {78, -10}}), Rectangle(origin = {0, 70}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-78, 10}, {78, -10}})}));
  end Dist_Line_3p;

  model Bus
    ActiveNet.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.SIunits.Voltage Vmag "Voltage Magnitude";
    Modelica.SIunits.Angle Vangle "Voltage Angle";
  equation
    Vmag = sqrt(p.v.re ^ 2 + p.v.im ^ 2);
    Vangle = atan2(p.v.im, p.v.re);
    p.i = Complex(0);
    annotation(Icon(graphics = {Rectangle(origin = {0, -1}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-10, 101}, {10, -99}})}));
  end Bus;

  model Dist_Line_Z
    parameter Modelica.SIunits.Impedance R "Resistance";
    parameter Modelica.SIunits.Impedance X "Reactance";
    Modelica.SIunits.ComplexImpedance Z "Complex Impedance";
    extends ActiveNet.Connectors.OnePort;
  equation
    Z.re = R;
    Z.im = X;
    v = Z * i;
    annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-80, 10}, {80, -10}})}), Diagram);
  end Dist_Line_Z;
end Buses;
