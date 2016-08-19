within ActiveNet;

package Connectors
  connector Pin "Basic electric node"
    Modelica.SIunits.ComplexVoltage v "Complex potential at the node";
    flow Modelica.SIunits.ComplexCurrent i "Complex current flowing through the node";
    annotation(Icon(graphics = {Rectangle(origin = {1, -1}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-101, 101}, {99, -99}})}));
  end Pin;

  connector PositivePin "Positive electric node"
    Modelica.SIunits.ComplexVoltage v "Complex potential at the node";
    flow Modelica.SIunits.ComplexCurrent i "Complex current flowing through the node";
    annotation(Icon(graphics = {Rectangle(origin = {1, -1}, lineColor = {0, 128, 128}, fillColor = {255, 255, 255}, extent = {{-101, 101}, {99, -99}}), Line(origin = {0, -4}, points = {{0, 50}, {0, -44}}, color = {0, 128, 128}, thickness = 2), Line(origin = {20, 0}, points = {{-68, 0}, {32, 0}}, color = {0, 128, 128}, thickness = 2)}, coordinateSystem(initialScale = 0.1)));
  end PositivePin;

  connector NegativePin "Negative electric node"
    Modelica.SIunits.ComplexVoltage v "Complex potential at the node";
    flow Modelica.SIunits.ComplexCurrent i "Complex current flowing through the node";
    annotation(Icon(graphics = {Rectangle(origin = {1, -1}, lineColor = {0, 128, 128}, fillColor = {0, 128, 128}, extent = {{-101, 101}, {99, -99}})}, coordinateSystem(initialScale = 0.1)));
  end NegativePin;

  partial model TwoPin
    Modelica.SIunits.ComplexVoltage v "Complex Voltage Difference between the pins";
    flow Modelica.SIunits.ComplexCurrent i "Complex Current flowing through the pins";
    Modelica.SIunits.ComplexCurrent zero(re = 0, im = 0) "zero complex current";
    PositivePin p annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    NegativePin n annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    v = p.v - n.v;
    p.i + n.i = Complex(0);
    i = p.i;
  end TwoPin;

  partial model OnePort
    Modelica.SIunits.ComplexVoltage v "Complex potential at the node";
    flow Modelica.SIunits.ComplexCurrent i "Complex current flowing through the node";
    Modelica.SIunits.Voltage Vmag "Voltage Magnitude";
    Modelica.SIunits.Angle Vangle "Voltage Angle";
    Modelica.SIunits.Current Imag "Current Magnitude";
    DistLib_JCJ.Connectors.PositivePin p annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.NegativePin n annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Vmag = sqrt(v.re ^ 2 + v.im ^ 2);
    Vangle = atan2(v.im, v.re);
    Imag = sqrt(i.re ^ 2 + i.im ^ 2);
    v = p.v - n.v;
    p.i + n.i = Complex(0);
    i = p.i;
  end OnePort;

  partial model ThreePort
    Modelica.SIunits.ComplexVoltage v1 "Complex potential at node 1";
    flow Modelica.SIunits.ComplexCurrent i1 "Complex current flowing through the node 1";
    Modelica.SIunits.ComplexVoltage v2 "Complex potential at the node 2";
    flow Modelica.SIunits.ComplexCurrent i2 "Complex current flowing through the node 2";
    Modelica.SIunits.ComplexVoltage v3 "Complex potential at the node 3";
    flow Modelica.SIunits.ComplexCurrent i3 "Complex current flowing through the node 3";
    Modelica.SIunits.Voltage Vmag1 "Voltage Polar Magnitude 1";
    Modelica.SIunits.Current Imag1 "Current Polar Magnitude 1";
    Modelica.SIunits.Angle Vangle1 "Voltage Angle 1";
    Modelica.SIunits.Angle Iangle1 "Current Angle 1";
    Modelica.SIunits.Voltage Vmag2 "Voltage Polar Magnitude 2";
    Modelica.SIunits.Current Imag2 "Current Polar Magnitude 2";
    Modelica.SIunits.Angle Vangle2 "Voltage Angle 2";
    Modelica.SIunits.Angle Iangle2 "Current Angle 2";
    Modelica.SIunits.Voltage Vmag3 "Voltage Polar Magnitude 3";
    Modelica.SIunits.Current Imag3 "Current Polar Magnitude 3";
    Modelica.SIunits.Angle Vangle3 "Voltage Angle 3";
    Modelica.SIunits.Angle Iangle3 "Current Angle 3";
    Modelica.SIunits.ComplexCurrent zero(re = 0, im = 0) "complex representation of Zero";
    DistLib_JCJ.Connectors.PositivePin p1 annotation(Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.NegativePin n1 annotation(Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.PositivePin p2 annotation(Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.NegativePin n2 annotation(Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.PositivePin p3 annotation(Placement(visible = true, transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DistLib_JCJ.Connectors.NegativePin n3 annotation(Placement(visible = true, transformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    v1.re = Vmag1 * cos(Vangle1);
    v1.im = Vmag1 * sin(Vangle1);
    i1.re = Imag1 * cos(Iangle1);
    i1.im = Imag1 * sin(Iangle1);
    v1 = p1.v - n1.v;
    zero = p1.i + n1.i;
    i1 = p1.i;
    v2.re = Vmag2 * cos(Vangle2);
    v2.im = Vmag2 * sin(Vangle2);
    i2.re = Imag2 * cos(Iangle2);
    i2.im = Imag2 * sin(Iangle2);
    v2 = p2.v - n2.v;
    zero = p2.i + n2.i;
    i2 = p2.i;
    v3.re = Vmag3 * cos(Vangle3);
    v3.im = Vmag3 * sin(Vangle3);
    i3.re = Imag3 * cos(Iangle3);
    i3.im = Imag3 * sin(Iangle3);
    v3 = p3.v - n3.v;
    zero = p3.i + n3.i;
    i3 = p3.i;
  end ThreePort;
end Connectors;