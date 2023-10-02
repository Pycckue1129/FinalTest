import java.util.ArrayList;

public abstract class Animal {
    private String name;
    private int age;
    private String gender;
    private ArrayList<String> commands;

    public void setName(String name) {
        this.name = name;
    }

    public Animal(String name, int age, String gender) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        commands = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public ArrayList<String> getCommands() {
        return commands;
    }

    public void addCommand(String command) {
        commands.add(command);
    }

}


