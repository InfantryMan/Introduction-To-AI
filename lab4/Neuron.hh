#include <vector>
#include <ctime>
#include <cstdlib>

#define W_RAND_FROM 0
#define W_RAND_TO   1
#define W_RAND_STEP 0.001  

#define PI_MIN 0.75
#define PI_MAX 1.0

#define PI 3.141592654

typedef std::vector<float> fvector;

class Neuron {
    private:
        float G(int m, float SigmaK);

    public:
        // int number; // номер нейрона в массиве
        float eta; // коэффициент обучения
        int WiSize;  // размер вектора весов
        fvector Wi; // вектор весов
        float pi;   // потенциал для штрафования

        // Neuron(int _number, float _eta): number(_number), eta(_eta) {};
        Neuron(int _WiSize, float _eta);
        Neuron(){};

        void changeW(int m, float SigmaK, const fvector & Xk);
        void changeEta(float etaMin, float etaMax, int k, int Kmax);

        void changePiWin();
        void changePiLose(int M);

        bool check_participate();
};

float random_value(float from, float to, float step) {
    int numbers_num = (to - from) / step;
    return from + ((float) (rand() % numbers_num) * step);
}

void spiral_evklida(float *x, float *y) {
    float t = float (rand() / (RAND_MAX + 1.0)) * 4 * PI;
    *y = 0.04 * t * sin(t) + 0.5;
    *x = 0.04 * t * cos(t) + 0.5 - 0.05;
}

Neuron::Neuron(int _WiSize, float _eta): WiSize(_WiSize), eta(_eta), pi(PI_MIN) {
    Wi = fvector(WiSize);
    spiral_evklida(&Wi[0], &Wi[1]);
//    float Wfrom = W_RAND_FROM, Wto = W_RAND_TO, Wstep = W_RAND_STEP;
//    for (int i = 0; i < WiSize; i++) {
//        Wi[i] = random_value(Wfrom, Wto, Wstep);
//    }
}

void Neuron::changeW(int m, float SigmaK, const fvector & Xk) {
    for (int j = 0; j < Wi.size(); j++) {
        // printf("%f\n", eta * G(m, SigmaK) * (Xk[j] - Wi[j]));
        Wi[j] = Wi[j] + eta * G(m, SigmaK) * (Xk[j] - Wi[j]);
    }
}

void Neuron::changeEta(float etaMin, float etaMax, int k, int Kmax) {
    float a = (etaMin / etaMax);
    float b = (float)(k + 1) / (float) (Kmax);
    eta = etaMax * pow(a, b);
}

float Neuron::G(int m, float SigmaK) {
    return exp((-1) * (m / SigmaK));
}

void Neuron::changePiWin() {
    pi -= PI_MIN;
    if (pi < 0.0) pi = 0.0;
}

void Neuron::changePiLose(int M) {
    pi += 1.0 / M;
    if (pi > PI_MAX) pi = PI_MAX;
}

bool Neuron::check_participate() {
    return pi >= PI_MIN;
}
