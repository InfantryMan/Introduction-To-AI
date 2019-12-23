#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cmath>

#include "NeuronNet.hh"

#define INPUT_VECTOR_SIZE 2

void print_vector_fvector(vector_fvector vfv) {
    for (int i = 0; i < vfv.size(); i++) {
        for (int j = 0; j < vfv[i].size(); j++) {
            std::cout << vfv[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

// 1 аргумент - файл с данными
// 2 аргумент - количество нейронов
// 3 аргумент - количество циклов обучения
int main(int argc, char **argv) {
    if (argc != 4) {
        std::cerr << "Неправильный ввод.\nВведите данные следующим образом:\n"
                     "1 аргумент - файл с данными\n"
                     "2 аргумент - количество нейронов,\n"
                     "3 аргумент - количество циклов обучения.\n" << std::endl;
        exit(EXIT_FAILURE);
    }
    char *filename = argv[1];
    int neurons_number = atoi(argv[2]);
    int epoch_num = atoi(argv[3]);

    srand(time(NULL));
    NeuronNet neuronNet(neurons_number, INPUT_VECTOR_SIZE);

    vector_fvector train_vectors;
    
    std::ifstream fin(filename);
    float x1, x2;
    while (fin >> x1 >> x2) {
        fvector train_vector(INPUT_VECTOR_SIZE);
        train_vector[0] = x1;
        train_vector[1] = x2;
        train_vectors.push_back(train_vector);
    }

    FILE* gnuplotPipe;
    gnuplotPipe = popen("gnuplot -persistent", "w");
    fprintf(gnuplotPipe, "set multiplot\n");
    fprintf(gnuplotPipe, "set xrange [0:1]\n");
    fprintf(gnuplotPipe, "set yrange [0:1]\n");
   
    neuronNet.train(train_vectors, epoch_num, gnuplotPipe);
    
    fclose(gnuplotPipe);
}
