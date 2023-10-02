
import java.util.ArrayList;
import java.util.Scanner;

public class AnimalRegistry {
    private final ArrayList<Animal> animals;
    private final Counter counter;

    public AnimalRegistry() {
        animals = new ArrayList<>();
        counter = new Counter();
    }

    public void addAnimal(Animal animal) {
        animals.add(animal);
        counter.add();
    }

    public void classifyAnimals() {
        for (Animal animal : animals) {
            if (animal instanceof Dog || animal instanceof Cat || animal instanceof Hamster) {
                System.out.println(animal.getName() + " домашнее животное.");
            } else if (animal instanceof Horse || animal instanceof Camel || animal instanceof Donkey) {
                System.out.println(animal.getName() + " вьючное животное.");
            } else {
                System.out.println(animal.getName() + " неизвестное животное.");
            }
        }
    }

    public void listCommands() {
        for (Animal animal : animals) {
            System.out.println(animal.getName() + " может " + animal.getCommands());
        }
    }

    public void teachCommand(String name, String command) {
        for (Animal animal : animals) {
            if (animal.getName().equals(name)) {
                animal.addCommand(command);
                System.out.println(name + " умеет " + command);
                return;
            }
        }
        System.out.println("Животное не найдено.");
    }

    public static void main(String[] args) {
        AnimalRegistry registry = new AnimalRegistry();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("1. Добавить животное");
            System.out.println("2. Список животных");
            System.out.println("3. Список команд");
            System.out.println("4. Учить команду");
            System.out.println("5. Выход");
            System.out.print("Введите значение: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1 -> {
                    System.out.print("Введите имя животного: ");
                    String name = scanner.nextLine();
                    System.out.print("Введите возраст животного: ");
                    int age = scanner.nextInt();
                    scanner.nextLine();
                    System.out.print("Введите пол животного: ");
                    String gender = scanner.nextLine();
                    System.out.print("Введите вид животного (собака, кошка, хомяк, лошадь, верблюд, осел): ");
                    String species = scanner.nextLine();
                    Animal animal;
                    switch (species) {
                        case "собака" -> animal = new Dog(name, age, gender);
                        case "кошка" -> animal = new Cat(name, age, gender);
                        case "хомяк" -> animal = new Hamster(name, age, gender);
                        case "лошадь" -> animal = new Horse(name, age, gender);
                        case "верблюд" -> animal = new Camel(name, age, gender);
                        case "осел" -> animal = new Donkey(name, age, gender);
                        default -> {
                            System.out.println("Неизвестный вид.");
                            continue;
                        }
                    }
                    registry.addAnimal(animal);
                    System.out.println(species + name + " добавлена в базу.");
                }
                case 2 -> registry.classifyAnimals();
                case 3 -> registry.listCommands();
                case 4 -> {
                    System.out.print("Введите имя животного, которого хотите обучить новой команде: ");
                    String animalName = scanner.nextLine();
                    System.out.print("Введите новую команду: ");
                    String newCommand = scanner.nextLine();
                    registry.teachCommand(animalName, newCommand);
                }
                case 5 -> {
                    System.out.println("Выход из программы.");
                    scanner.close();
                    try {
                        registry.counter.close();
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                    System.exit(0);
                }
                default -> System.out.println("Ошибка. Введите правильный вариант");
            }
        }
    }
}