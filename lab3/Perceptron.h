#include <vector>
#include <iostream>
#include <cstdlib>
#include <ctime> // содержит time()

typedef std::vector<double> dvector;
typedef std::pair<dvector, double> train_pair;
typedef std::vector<train_pair> train_pairs;

float pause = 1.0;

class Perceptron {

public:
    int N;
    dvector W;

    Perceptron(int _N);

    int activ_func(double u);
    double random_for_w();    

    void train(const train_pairs &tp, int epoch, int try_limit, FILE *gnuplotPipe);
};

void print_dvector(dvector &dv) {
    for (int i = 0; i < dv.size(); i++) {
        std::cout << dv[i] << " ";
    }
    std::cout << std::endl;
}

void plot_dots(const train_pairs &tps, FILE *gnuplotPipe) {
    for (int i = 0; i < tps.size(); i++) {
        int color = 0;
        int pt = 1;
        if (tps[i].second == 1) {
            color = 2;
            pt = 3;
        } else {
            color = 1;
            pt = 2;
        }
        fprintf(gnuplotPipe, "plot '-' w p lc %d pt %d lw 1\n", color, pt);
        fprintf(gnuplotPipe, "%lf %lf\n", tps[i].first[0], tps[i].first[1]);
        fprintf(gnuplotPipe, "e\n");
    }
}

Perceptron::Perceptron(int _N): N(_N) {
    W = dvector(N + 1);
    srand(time(NULL));
    for (int i = 0; i < W.size(); i++) {
        // W[i] = 0;
        W[i] = random_for_w();
    }
    W[0] = -0.94;
    W[1] = 0.19;
    W[2] = -0.24;
}

int Perceptron::activ_func(double u) {
    return (u >= 0);
}

double Perceptron::random_for_w() {
    return (double)(rand() % 201 - 100) / 100;
}

void Perceptron::train(const train_pairs &tps, int epoch_count, int try_limit, FILE *gnuplotPipe) {
    double k , b;

    for (int epoch = 0; epoch < epoch_count; epoch++) {
        for (int tp_number = 0; tp_number < tps.size(); tp_number++) {
            const train_pair &tp = tps[tp_number];
            std::cout << tp.first[0] << " " << tp.first[1] << std::endl;
            std::cout << W[0] << " " << W[1] << " " << W[2] << std::endl;
            int try_count = 0;
            k = - (W[1] / W[2]), b = - (W[0] / W[2]);

            fprintf(gnuplotPipe, "unset multiplot\nset multiplot\n");
            plot_dots(tps, gnuplotPipe);
            fprintf(gnuplotPipe, "plot %lf*x+%lf notitle\n", k, b);
            fprintf(gnuplotPipe, "pause %f\n", pause);
            fflush(gnuplotPipe);

            while (try_count < try_limit) {
                double u = 0;
                u += W[0];
                for (int i = 1; i < tp.first.size() + 1; i++) {
                    u += W[i] * tp.first[i - 1];
                }
                double y = activ_func(u);
                std::cout << "y = " << y << "; d = " << tp.second << "; u = " << u << std::endl;
                if (y == tp.second) { 
                    print_dvector(W);
                    break; 
                }
                W[0] += tp.second - y;
                for (int i = 1; i < tp.first.size() + 1; i++) {
                    W[i] += tp.first[i - 1]*(tp.second - y);
                    // W[i] += (tp.second - y);
                }
                k = - (W[1] / W[2]), b = - (W[0] / W[2]);
                // fprintf(gnuplotPipe, "unset multiplot\nset multiplot\n");
                // plot_dots(tps, gnuplotPipe);
                // fprintf(gnuplotPipe, "plot %lf*x+%lf notitle\n", k, b);
                // fprintf(gnuplotPipe, "pause 0.1\n");
                // fflush(gnuplotPipe);
                try_count++;
            }

            fprintf(gnuplotPipe, "unset multiplot\nset multiplot\n");
            plot_dots(tps, gnuplotPipe);
            fprintf(gnuplotPipe, "plot %lf*x+%lf notitle\n", k, b);
            fprintf(gnuplotPipe, "pause %f\n", pause);
            fflush(gnuplotPipe);
        }
    }
}