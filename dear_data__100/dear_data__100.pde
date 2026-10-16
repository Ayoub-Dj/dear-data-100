Table table;

void setup() {
  size(800, 500);
  table = loadTable("journeys.csv", "header");
  background(255);
  noStroke();

  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    String day  = row.getString("day");
    String time = row.getString("time");
    String line = row.getString("line");

    fill(getColour(line));
    ellipse(getX(day), getY(time), 20, 20);
  }
}

float getX(String day) {
  String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday",
                   "Friday", "Saturday", "Sunday"};
  for (int i = 0; i < days.length; i++) {
    if (days[i].equals(day)) {
      return 80 + i * 100;
    }
  }
  return 0;
}

float getY(String time) {
  String[] parts = split(time, ':');
  float hours = float(parts[0]) + float(parts[1]) / 60.0;
  return map(hours, 0, 24, 40, height - 40);
}

color getColour(String line) {
  if (line.equals("Elizabeth line")) return color(110, 60, 160);
  if (line.equals("Jubilee line"))   return color(134, 143, 152);
  if (line.equals("DLR"))            return color(0, 175, 173);
  if (line.equals("Circle line"))    return color(255, 211, 0);
  return color(0);
}
