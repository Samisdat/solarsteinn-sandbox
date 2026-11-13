// Hello world, C++ edition: a tour of the syntax.
#include <algorithm>
#include <iostream>
#include <map>
#include <memory>
#include <string>
#include <string_view>
#include <vector>

namespace hello {

constexpr int kMax = 10'000;

template <typename T>
concept Printable = requires(T t, std::ostream& os) { os << t; };

class Speaker {
public:
    virtual ~Speaker() = default;
    virtual std::string speak(std::string_view name) const = 0;
};

class Loud final : public Speaker {
public:
    explicit Loud(std::string prefix) : prefix_{std::move(prefix)} {}

    std::string speak(std::string_view name) const override {
        std::string out = prefix_ + std::string{name} + "!";
        std::transform(out.begin(), out.end(), out.begin(), ::toupper);
        return out;
    }

private:
    std::string prefix_;
};

template <Printable T>
void print_all(const std::vector<T>& xs) {
    for (const auto& x : xs) {
        std::cout << x << '\n';
    }
}

}  // namespace hello

int main() {
    auto speaker = std::make_unique<hello::Loud>("hello there, ");
    std::map<std::string, int> counts{{"en", 1}, {"de", 2}};
    auto lambda = [&counts](const std::string& k) -> int { return counts.at(k); };
    std::vector<std::string> names{"world", "welt"};
    for (auto&& n : names) {
        std::cout << speaker->speak(n) << ' ' << lambda("en") << R"(raw "string")" << '\n';
    }
    hello::print_all(names);
    return nullptr == nullptr ? 0 : 1;
}
