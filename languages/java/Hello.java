package org.example.hello;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Hello world, Java edition: a tour of the syntax.
 *
 * @author Samisdat
 */
@SuppressWarnings("unused")
public final class Hello {
    private static final int MAX = 10_000;
    private static final String NAME = "world\t\"quoted\"";

    sealed interface Shape permits Circle, Square {}
    record Circle(double radius) implements Shape {}
    record Square(double side) implements Shape {}

    enum Level { QUIET, LOUD }

    @FunctionalInterface
    interface Greeter<T extends CharSequence> {
        String greet(T name);
    }

    private final List<String> names = new ArrayList<>();

    public Hello(String... names) {
        for (String n : names) {
            this.names.add(n);
        }
    }

    static double area(Shape s) {
        return switch (s) {
            case Circle c -> Math.PI * c.radius() * c.radius();
            case Square q -> q.side() * q.side();
        };
    }

    public Optional<String> first() {
        return names.stream().findFirst();
    }

    @Override
    public String toString() {
        Function<String, String> upper = String::toUpperCase;
        return names.stream().map(upper).collect(Collectors.joining(", ", "[", "]"));
    }

    public static void main(String[] args) throws Exception {
        var hello = new Hello("world", "welt");
        Greeter<String> g = n -> "hello, " + n + "!!";
        long big = 123_456_789L;
        char c = '\u00fc';
        String block = """
            text block
            """;
        try {
            System.out.println(g.greet(NAME) + hello + area(new Circle(1.5)) + big + c + block);
        } catch (IllegalStateException | IllegalArgumentException e) {
            throw new RuntimeException(e);
        } finally {
            System.out.println(hello.first().orElse("none"));
        }
    }
}
