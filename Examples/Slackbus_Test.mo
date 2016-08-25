within ActiveNet.Examples;

model Slackbus_Test

  Sources.SlackBus slackBus1(V = 1, Vangle(displayUnit = "rad") = 0)  annotation(Placement(visible = true, transformation(origin = {-70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buses.Dist_Line_1p dist_Line_1p1(L = 100, Rl = 0.001, Xl = 0.0001)  annotation(Placement(visible = true, transformation(origin = {-46, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.PQ_Load_1p pQ_Load_1p1(P = 1, Q = 0.5)  annotation(Placement(visible = true, transformation(origin = {-14, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(slackBus1.p, dist_Line_1p1.p) annotation(Line(points = {{-70, 2}, {-56, 2}, {-56, 2}, {-56, 2}}, color = {0, 128, 128}));
  connect(dist_Line_1p1.n, pQ_Load_1p1.p) annotation(Line(points = {{-36, 2}, {-14, 2}, {-14, -4}, {-14, -4}}, color = {0, 128, 128}));
end Slackbus_Test;