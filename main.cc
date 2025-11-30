#include <drogon/drogon.h>
#include <nlohmann/json.hpp>
#include <fstream>

using namespace std;
using json = nlohmann::json;
int main() {
    fstream Information("../config.json");

    json data = json::parse(Information);

    string address = data["listeners"][0]["address"];
    int port = data["listeners"][0]["port"];

    cout << "The server is running with the address " << address << ":" << port << endl;
    drogon::app().loadConfigFile("../config.json");
    drogon::app().run();
    return 0;
}
