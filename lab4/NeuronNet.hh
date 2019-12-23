#include "Neuron.hh"
#include <utility>
#include <algorithm>

// #define SIGMA_INIT 50.0
// #define SIGMA_MAX 10.0
// #define SIGMA_MIN 0.001

// #define ETA_INIT 1.0
// #define ETA_MAX  1.0
// #define ETA_MIN  0.001

#define SIGMA_INIT 0.1
#define SIGMA_MAX 1.0
#define SIGMA_MIN 0.001

#define ETA_INIT 0.01
#define ETA_MAX  1.0
#define ETA_MIN  0.001

float pause = 2;

typedef std::vector<Neuron> neuron_vector;
typedef std::vector<fvector> vector_fvector;

class NeuronNet {
    private:
        float calculate_d(const fvector &, const fvector &);

    public:
        int neurons_number;     // количество нейронов
        neuron_vector neurons;  // вектор нейронов
        float sigmak;

        NeuronNet(int _neurons_number, int input_vector_size);

        void train(vector_fvector train_vectors, int epochNum, FILE *gnuplotPipe);

        vector_fvector getW();
};

void print_neuronNet(const NeuronNet & neuronNet) {
    const neuron_vector & nv = neuronNet.neurons;
    for (int i = 0; i < 1; i++) {
        std::cout << "Нейрон " << i << std::endl;
        for (int j = 0; j < nv[0].WiSize; j++) {
            printf("W%d %d=%f; pi=%f\n", i, j, nv[i].Wi[j],nv[i].pi);
        }
        printf("Sigma=%f; Eta =%f\n", neuronNet.sigmak, neuronNet.neurons[0].eta);
        std::cout << std::endl;
    }
}

void plot_dots(FILE *gnuplotPipe, const vector_fvector & train_vectors, const vector_fvector & W, int k) {
    fprintf(gnuplotPipe, "unset multiplot\nset multiplot\n");
    int color, pt;
    for (int i = 0; i < k; i++) {
        color = 0;
        pt = 1;
        fprintf(gnuplotPipe, "plot '-' w p lc %d pt %d lw 1\n", color, pt);
        fprintf(gnuplotPipe, "%lf %lf\n", train_vectors[i][0], train_vectors[i][1]);
        fprintf(gnuplotPipe, "e\n");
    }

    if (k < train_vectors.size()) {
        color = 1;
        pt = 7;
        fprintf(gnuplotPipe, "plot '-' w p lc %d pt %d lw 1\n", color, pt);
        fprintf(gnuplotPipe, "%lf %lf\n", train_vectors[k][0], train_vectors[k][1]);
        fprintf(gnuplotPipe, "e\n");
    }
    
    for (int i = k; i < train_vectors.size(); i++) {
        color = 2;
        pt = 3;
        fprintf(gnuplotPipe, "plot '-' w p lc %d pt %d lw 1\n", color, pt);
        fprintf(gnuplotPipe, "%lf %lf\n", train_vectors[i][0], train_vectors[i][1]);
        fprintf(gnuplotPipe, "e\n");
    }

    for (int i = 0; i < W.size(); i++) {
        color = 4;
        pt = 5;
        fprintf(gnuplotPipe, "plot '-' w p lc %d pt %d lw 1\n", color, pt);
        fprintf(gnuplotPipe, "%lf %lf\n", W[i][0], W[i][1]);
        fprintf(gnuplotPipe, "e\n");
    }
    fprintf(gnuplotPipe, "pause %f\n", pause);
    fflush(gnuplotPipe);
}

NeuronNet::NeuronNet(int _neurons_number, int input_vector_size): neurons_number(_neurons_number), sigmak(SIGMA_INIT) {
    neurons = neuron_vector(neurons_number);
    for (int i = 0; i < neurons_number; i++) {
        neurons[i] = Neuron(input_vector_size, ETA_INIT);
    }
}

void NeuronNet::train(vector_fvector train_vectors, int epochNum, FILE *gnuplotPipe) {
    const int Kmax = train_vectors.size();
    for (int epoch = 0, kGlobal = 0; epoch < epochNum; epoch++) {
        for (int k = 0; k < Kmax; k++, kGlobal++) {
            if (k == 3) {
                pause = 0.1;
            }
            plot_dots(gnuplotPipe, train_vectors, getW(), k);
            fvector Xk = train_vectors[k];
            printf("x=%f\ty=%f\n", Xk[0], Xk[1]);
            std::vector<std::pair<int, float>> neuronId_d_vector;
            for (int i = 0; i < neurons.size(); i++) {
                if (k < 3) {
                    if (neurons[i].check_participate()) {
                        fvector Wi = neurons[i].Wi;
                        const float d = calculate_d(Xk, Wi);
                        neuronId_d_vector.push_back(std::pair<int, float>(i, d));
                    }
                } else {
                    fvector Wi = neurons[i].Wi;
                    const float d = calculate_d(Xk, Wi);
                    neuronId_d_vector.push_back(std::pair<int, float>(i, d));
                }
            }
            // Сортировка по d
            std::sort(neuronId_d_vector.begin(), neuronId_d_vector.end(), 
                [](const std::pair<int, float>& p1, const std::pair<int, float>& p2) {
                    return (p1.second < p2.second);
                });
            for (int m = 0; m < neuronId_d_vector.size(); m++) {
                int neuronId = neuronId_d_vector[m].first;
                neurons[neuronId].changeW(m, sigmak, Xk);
                neurons[neuronId].changeEta(ETA_MIN, ETA_MAX, kGlobal, Kmax * (epochNum));
            }
            if (k < 3) {
                for (int i = 0; i < neurons.size(); i++) {
                    if (i != neuronId_d_vector[0].first) {
                        neurons[i].changePiLose(neurons_number);
                    } else {
                        neurons[i].changePiWin();
                    }
                }
            }
            float a = (SIGMA_MIN / SIGMA_MAX);
            float b = (float)((kGlobal + 1)) / (float) (Kmax * (epochNum));
            sigmak = SIGMA_MAX * pow(a, b);
            printf("k = %d\n", kGlobal);
        }
        plot_dots(gnuplotPipe, train_vectors, getW(), Kmax);
    }
}

float NeuronNet::calculate_d(const fvector & Xk, const fvector & Wi) {
    float d = 0.0;
    for (int i = 0; i < Xk.size(); i++) {
        float delta = pow((Xk[i] - Wi[i]), 2);
        d += delta;
    }
    return sqrt(d);
}

vector_fvector NeuronNet::getW() {
    vector_fvector W;
    for (int i = 0; i < neurons_number; i++) {
        fvector Wi = neurons[i].Wi;
        W.push_back(Wi);
    }
    return W;
}
