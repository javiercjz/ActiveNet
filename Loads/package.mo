within ActiveNet;

package Loads
  model PQ_Load_1p
    parameter Modelica.SIunits.ActivePower P "Active Power";
    parameter Modelica.SIunits.ReactivePower Q "Reactive Power";
    Modelica.SIunits.Voltage Vmag "Voltage Magnitude";
    Modelica.SIunits.Angle phi "Power Angle";
    Modelica.SIunits.Angle Vangle "Voltage Angle";
    Modelica.SIunits.Angle Iangle "Current Angle";
    DistLib_JCJ.Connectors.Pin p annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    P = p.v.re * p.i.re + p.v.im * p.i.im;
    Q = p.v.im * p.i.re - p.v.re * p.i.im;
    Vmag = sqrt(p.v.re ^ 2 + p.v.im ^ 2);
    phi = Iangle - Vangle;
    Vangle = atan2(p.v.im, p.v.re);
    Iangle = atan2(p.i.im, p.i.re);
    annotation(Icon(graphics = {Ellipse(origin = {1, -19}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, extent = {{-81, 89}, {79, -71}}, endAngle = 360), Text(origin = {0, -11}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, extent = {{-52, 61}, {52, -61}}, textString = "PQ", fontName = "DejaVu Sans Mono")}));
  end PQ_Load_1p;

  model PQ_Load_3p
    parameter Modelica.SIunits.ActivePower P "3p Active Power";
    parameter Modelica.SIunits.ReactivePower Q "3p Reactive Power";
    DistLib_JCJ.Loads.PQ_Load_1p pQ_Load_1p1(P = P / 3, Q = Q / 3) annotation(Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Loads.PQ_Load_1p pQ_Load_1p2(P = P / 3, Q = Q / 3) annotation(Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Loads.PQ_Load_1p pQ_Load_1p3(P = P / 3, Q = Q / 3) annotation(Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Connectors.PositivePin p1 annotation(Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Connectors.PositivePin p2 annotation(Placement(visible = true, transformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Connectors.PositivePin p3 annotation(Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(pQ_Load_1p3.p, p3) annotation(Line(points = {{90, 50}, {90, 50}, {90, 90}, {90, 90}}, color = {0, 128, 128}));
    connect(pQ_Load_1p2.p, p2) annotation(Line(points = {{0, 50}, {0, 50}, {0, 90}, {0, 90}}, color = {0, 128, 128}));
    connect(pQ_Load_1p1.p, p1) annotation(Line(points = {{-90, 50}, {-90, 50}, {-90, 90}, {-90, 90}}, color = {0, 128, 128}));
    annotation(Icon(graphics = {Ellipse(origin = {0, -38}, lineColor = {0, 128, 128}, extent = {{-80, 106}, {80, -54}}, endAngle = 360), Text(origin = {0, -6}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, extent = {{-56, 52}, {58, -62}}, textString = "PQ", fontName = "DejaVu Sans Mono")}));
  end PQ_Load_3p;
end Loads;