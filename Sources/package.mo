within ActiveNet;

package Sources
  model VSource_1p
    parameter Modelica.SIunits.Voltage V "Voltage Magnitude";
    parameter Modelica.SIunits.Angle phi "Voltage Angle";
    extends ActiveNet.Connectors.OnePort(Vmag = V, Vangle = phi);
    annotation(Icon(graphics = {Ellipse(origin = {-1, 10}, lineColor = {0, 128, 128}, extent = {{-59, 50}, {61, -70}}, endAngle = 360), Text(origin = {2, -5}, lineColor = {0, 128, 128}, extent = {{-44, 45}, {42, -41}}, textString = "V", fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
  end VSource_1p;

  model SlackBus
    parameter Modelica.SIunits.Angle Vangle "Angle Magnitude at the feeder";
    parameter Modelica.SIunits.Voltage V "Voltage Magnitude";
    Modelica.SIunits.ActivePower P "Active Power";
    Modelica.SIunits.ReactivePower Q "Reactive Power";
    Modelica.SIunits.ComplexVoltage v "Complex Voltage at the feeder";
    flow Modelica.SIunits.ComplexCurrent i "Complex Current going through the Feeder";
    ActiveNet.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    P = v.re * i.re + v.im * i.im;
    Q = v.im * i.re - v.re * i.im;
    i = p.i;
    v = p.v;
    V = sqrt(v.re ^ 2 + v.im ^ 2);
    Vangle = atan2(v.im, v.re);
    annotation(Icon(graphics = {Line(origin = {0, -1}, points = {{0, 101}, {0, -99}, {0, -99}}, color = {0, 128, 128})}));
  end SlackBus;

  model PV_Source
    parameter Modelica.SIunits.Voltage V "Voltage Magnitude at the Feeder";
    parameter Modelica.SIunits.ActivePower P "Power supplied by the generator";
    Modelica.SIunits.Angle phi(start = 0) "Angle Magnitude at the feeder";
    Modelica.SIunits.ReactivePower Q(start = 0) "Reactive power at the Bus";
    Modelica.SIunits.ComplexVoltage v "Complex Voltage at the feeder";
    flow Modelica.SIunits.ComplexCurrent i "Complex Current going from the PV bus";
    ActiveNet.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    P = v.re * i.re + v.im * i.im;
    Q = v.im * i.re - v.re * i.im;
    -i = p.i;
    v = p.v;
    v.re = V * cos(phi);
    v.im = V * sin(phi);
    annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Ellipse(origin = {-4, 13}, lineColor = {0, 128, 128}, extent = {{-76, 67}, {84, -93}}, endAngle = 360), Polygon(origin = {0, 55.72}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, points = {{-10, -11.7236}, {10, -11.7236}, {0, 20.2764}, {-10, -11.7236}}), Line(origin = {0, 24}, points = {{0, 20}, {0, -20}}, color = {0, 128, 128}), Text(origin = {1, -12}, lineColor = {0, 128, 128}, extent = {{-59, 54}, {59, -54}}, textString = "PV", fontName = "DejaVu Sans Mono")}));
  end PV_Source;

  model PV_Source_QFixed
    parameter Modelica.SIunits.Voltage V "Voltage Magnitude at the Feeder";
    parameter Modelica.SIunits.ActivePower P "Power supplied by the generator";
    parameter Modelica.SIunits.ReactivePower Q "Reactive Power Supplied by the generator";
    Modelica.SIunits.Angle phi(start = 0) "Angle Magnitude at the feeder";
    Modelica.SIunits.ComplexVoltage v "Complex Voltage at the feeder";
    flow Modelica.SIunits.ComplexCurrent i "Complex Current going from the PV bus";
    ActiveNet.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    P = v.re * i.re + v.im * i.im;
    -i = p.i;
    v = p.v;
    v.re = V * cos(phi);
    v.im = V * sin(phi);
    annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Ellipse(origin = {-4, 13}, lineColor = {0, 128, 128}, extent = {{-76, 67}, {84, -93}}, endAngle = 360), Polygon(origin = {0, 55.72}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, points = {{-10, -11.7236}, {10, -11.7236}, {0, 20.2764}, {-10, -11.7236}}), Line(origin = {0, 24}, points = {{0, 20}, {0, -20}}, color = {0, 128, 128}), Text(origin = {1, -12}, lineColor = {0, 128, 128}, extent = {{-59, 54}, {59, -54}}, textString = "PV", fontName = "DejaVu Sans Mono")}));
  end PV_Source_QFixed;

  model VSource_3p
    parameter Modelica.SIunits.Voltage V "Generator Nominal Voltage";
    VSource_1p vSource_1p1(V = V, phi(displayUnit = "rad") = 0) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VSource_1p vSource_1p2(V = V, phi(displayUnit = "rad") = 2.0944) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    VSource_1p vSource_1p3(V = V, phi(displayUnit = "rad") = 4.18879) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin positivePin1 annotation(Placement(visible = true, transformation(origin = {90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin positivePin2 annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ActiveNet.Connectors.PositivePin positivePin3 annotation(Placement(visible = true, transformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Components.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-20, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(vSource_1p1.n, ground1.p) annotation(Line(points = {{-8, 40}, {-20, 40}, {-20, -60}, {-20, -60}, {-20, -60}}, color = {0, 128, 128}));
    connect(vSource_1p2.n, ground1.p) annotation(Line(points = {{-8, 0}, {-20, 0}, {-20, -62}, {-20, -62}, {-20, -60}}, color = {0, 128, 128}));
    connect(vSource_1p3.n, ground1.p) annotation(Line(points = {{-8, -40}, {-20, -40}, {-20, -60}, {-20, -60}, {-20, -60}}, color = {0, 128, 128}));
    connect(vSource_1p3.p, positivePin3) annotation(Line(points = {{10, -40}, {86, -40}, {86, -40}, {90, -40}}, color = {0, 128, 128}));
    connect(vSource_1p2.p, positivePin2) annotation(Line(points = {{10, 0}, {88, 0}, {88, 0}, {90, 0}}, color = {0, 128, 128}));
    connect(vSource_1p1.p, positivePin1) annotation(Line(points = {{10, 40}, {84, 40}, {84, 40}, {90, 40}}, color = {0, 128, 128}));
    annotation(Icon(graphics = {Ellipse(origin = {3, -2}, lineColor = {0, 128, 128}, extent = {{-83, 82}, {77, -78}}, endAngle = 360), Text(origin = {0, -3}, lineColor = {0, 128, 128}, extent = {{-54, 63}, {54, -63}}, textString = "V_3p", fontName = "DejaVu Sans Mono")}));
  end VSource_3p;
end Sources;
