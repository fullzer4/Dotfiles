#include "csv.h"
#include <iostream>
#include <torch/torch.h>

struct Net : torch::nn::Module {
  torch::nn::Linear fc{4, 1};

  torch::Tensor forward(torch::Tensor x) {
    x = torch::relu(fc(x));
    return x;
  }
};

int main() {

  io::CSVReader<5> in("../data/train.csv");

  in.read_header(io::ignore_extra_column,
                 "SulphurDioxide_SO2_column_number_density",
                 "CarbonMonoxide_CO_column_number_density",
                 "NitrogenDioxide_NO2_column_number_density",
                 "Ozone_O3_column_number_density", "emission");

  std::vector<std::vector<double>> input_data;
  std::vector<double> target_data;

  double SO2_density, CO_density, NO2_density, O3_density, emission;
  while (
      in.read_row(SO2_density, CO_density, NO2_density, O3_density, emission)) {
    input_data.push_back({SO2_density, CO_density, NO2_density, O3_density});
    target_data.push_back(emission);
  }

  auto inputs = torch::from_blob(input_data.data(),
                                 {static_cast<long>(input_data.size()), 4});
  auto targets = torch::from_blob(target_data.data(),
                                  {static_cast<long>(target_data.size()), 1});

  Net net;
  torch::optim::SGD optimizer(net.parameters(), 0.01);
  torch::nn::MSELoss loss_fn;

  int num_epochs = 100;

  for (int epoch = 0; epoch < num_epochs; ++epoch) {
    optimizer.zero_grad();

    auto outputs = net.forward(inputs);

    auto loss = loss_fn(outputs, targets);

    loss.backward();
    optimizer.step();

    if ((epoch + 1) % 10 == 0) {
      std::cout << "Epoch: " << epoch + 1 << ", Loss: " << loss.item<float>()
                << std::endl;
    }
  }

  return 0;
}
