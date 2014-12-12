import java.util.Random;

ArrayList<String> people = new ArrayList<String>();
ArrayList<String> done = new ArrayList<String>();
Random r = new Random();


void setup() {
  people.add("Brendan Byrne");
  people.add("Alexander Crowder");
  people.add("Alec Dawson");
  people.add("Tingshan Gou");
  people.add("Shi Won Jang");
  people.add("Bryan Ma");
  people.add("Lucy Elizabeth Matchett");
  people.add("Alec McClure");
  people.add("Nicole Messier");
  people.add("Ayodamola Okunseinde");
  people.add("fito_segrera");
  people.add("Gabor Tankovics");
  people.add("Alexandra Tosti");
  people.add("Pierce Wolcott");
}

void draw() {
}

void keyPressed() {
  
  String nextStudent = people.get(r.nextInt(people.size()));
  while (done.contains(nextStudent)){
    nextStudent = people.get(r.nextInt(people.size()));
  }
  System.out.println(nextStudent);
  done.add(nextStudent);
}
