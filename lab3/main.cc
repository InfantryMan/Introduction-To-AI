#include <iostream>
#include <string>
#include <fstream>

#include "Perceptron.h"

std::string train_data_filename = "train_data.tsv";

/*
    Вариант 1-5.
    Разработать, используя язык C/C++, программу, моделирующую поведение искусственного трехвходового нейрона 
    указанного преподавателем типа и обеспечивающую его обучение для решения задачи классификации. 
    Тип нейрона - перцептрон.
*/

int main() {
    int try_limit;
    int epoch_count;

    std::cout << "Введите число эпох" << std::endl;
    std::cin >> epoch_count;

    std::cout << "Введите предельное количество циклов обучения" << std::endl;
    std::cin >> try_limit;

    if (epoch_count < 1 || try_limit < 1) {
        return -1;
    }

    std::ifstream fin(train_data_filename);
    double x1, x2, d;
    train_pairs tps;
    while (fin >> x1 >> x2 >> d) {
        dvector xk = dvector(2);
        xk[0] = x1;
        xk[1] = x2;
        train_pair tp = train_pair(xk, d);
        tps.push_back(tp);
    }   
    fin.close();

    FILE* gnuplotPipe;
    gnuplotPipe = popen("gnuplot -persistent", "w");
    fprintf(gnuplotPipe, "set multiplot\n");
    fprintf(gnuplotPipe, "set xrange [-3:9]\n");
    fprintf(gnuplotPipe, "set yrange [-3:9]\n");
    
    Perceptron perceptron(2);
    print_dvector(perceptron.W);

    perceptron.train(tps, epoch_count, try_limit, gnuplotPipe);

    // int j = 0;
    // while (j < 1) {
    //     for (int i = 0; i < tps.size(); i++) {
    //         perceptron.train(tps[i]);
    //     }
    //     j++;
    // }

    print_dvector(perceptron.W);

    

}