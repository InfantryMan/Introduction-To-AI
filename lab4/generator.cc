#include <iostream>
#include <stdlib.h>
#include <cmath>
#include <fstream>

#define PI 3.141592654

int main(int argc, char **argv) {
    char *filename = argv[1];
    int N = atoi(argv[2]);
    
    FILE *fp = fopen(filename, "w");
    if (fp == NULL) {
        std::cerr << "Невозможно открыть файл на запись." << std::endl;
        exit(EXIT_FAILURE);
    }

    srand(time(NULL));
    float x, y, t = 0;
    int i = 0;
    // Спираль Евклида
//    while (i < N) {
//        t = float (rand() / (RAND_MAX + 1.0)) * 4 * PI;
//        y = 0.04 * t * sin(t) + 0.5;
//        x = 0.04 * t * cos(t) + 0.5 - 0.05;
//        fprintf(fp, "%f\t%f\n", x, y);
//        i++;
//    }
    float step = (float) ((1.0 - 0.0) / (float) N);
    while (i < N) {
        t = (step * i) * 4 * PI;
        y = 0.04 * t * sin(t) + 0.5;
        x = 0.04 * t * cos(t) + 0.5 - 0.05;
        fprintf(fp, "%f\t%f\n", x, y);
        i++;
    }

    // Окружность
//     while (i < N) {
//         t = float (rand() / (RAND_MAX + 1.0)) * 2 * PI;
//         y = 0.5 * sin(t)+ 0.5;
//         x = 0.5 * cos(t) + 0.5;
//         fprintf(fp, "%f\t%f\n", x, y);
//         i++;
//     }
}
