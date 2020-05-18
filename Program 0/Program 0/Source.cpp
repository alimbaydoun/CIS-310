#include <iostream>

#include <string>

using namespace std;

string decimalToBCD(int x) {
    string bcd = "";
    while (x != 0) {
        int rem = x % 10;
        string temp;
        switch (rem) {
        case 0:
            temp = "0000";
        case 1:
            temp = "0001";
        case 2:
            temp = "0010";
        case 3:
            temp = "0011";
        case 4:
            temp = "0100";
        case 5:
            temp = "0101";
        case 6:
            temp = "0110";
        case 7:
            temp = "0111";
        case 8:
            temp = "1000";
        case 9:
            temp = "1001";
        }

        bcd = temp + " " + bcd;
        x = x / 10;
    }

    while (bcd.length() != 15)
        bcd = "0000 " + bcd;

    return bcd;
}

string decimalToBinary(int x) {
    string binary = "";
    while (x != 0) {
        binary = ((x % 2) ? "1" : "0") + binary;
        x = x / 2;
        if (binary.length() == 4)
            binary = " " + binary;
    }

    while (binary.length() != 9) {
        binary = "0" + binary;
        if (binary.length() == 4)
            binary = " " + binary;
    }

    return binary;
}

string decimalToHex(int x) {
    string hex = "";
    while (x != 0) {
        int rem = x % 16;
        string temp;
        if (rem < 10)
            temp = to_string(rem);
        else {
            switch (rem) {
            case 10:
                temp = "A";
            case 11:
                temp = "B";
            case 12:
                temp = "C";
            case 13:
                temp = "D";
            case 14:
                temp = "E";
            case 15:
                temp = "F";
            }
        }
        hex = temp + hex;
        x = x / 16;
    }

    while (hex.length() != 2)
        hex = "0" + hex;

    return hex;
}
int  main() {
    int i = 0;
    cout << "DECIMAL \t BINARY \t HEXADECIMAL \t\t BCD" << endl << endl;
    while (i < 256) {
        cout << i << "\t\t" << decimalToBinary(i) << "\t\t" << decimalToHex(i) << "\t\t" << decimalToBCD(i) << endl;
        i++;
    }
    system("pause");
    return 0;
}