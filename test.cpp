#include <iostream>
#include <nlohmann/json.hpp>
#include <fstream>

using namespace std;
using json = nlohmann::json;

int main() {
    ifstream s("config.json");
    json data = json::parse(s);
    int port = data["listeners"][0]["port"];
    cout << data << endl;
    cout << port << endl;
    return 0;
}