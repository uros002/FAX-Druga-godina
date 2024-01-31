using DataFrames, CSV, NearestNeighbors, MLBase, StatsBase, MLJ, Statistics, Logging

# Load data from CSV file into a data frame
df = DataFrame(CSV.File("Dijabetes1.csv", header=[:Starost, :Pol, :Dijabetes]))

# Extract data and labels from data frame
X = Matrix(df[:, 1:end-1])
y = df[:, end]

# Define model
model = KNNClassifier(K=3)

# Define K-Fold cross-validation function
function kfold_cv(k, model, X, y)
    n = size(X, 1)
    fold_size = round(Int, n / k)
    scores = zeros(k)
    for i = 1:k
        # Split data into training and validation sets
        idx = [(i-1)*fold_size+1:i*fold_size; (i*fold_size+1):min(n, (i+1)*fold_size)]
        train_data, train_labels = X[setdiff(1:n, idx), :], y[setdiff(1:n, idx)]
        valid_data, valid_labels = X[idx, :], y[idx]
        
        # Train model on training data
        fit!(model, train_data, train_labels)
        
        # Evaluate model on validation data
        y_pred = predict(model, valid_data)
        
        # Compute evaluation metric
        accuracy = mean(y_pred .== valid_labels)
        
        scores[i] = accuracy
    end
    return mean(scores)
end

# Perform K-Fold cross-validation
acc = kfold_cv(5, model, X, y)

# Print results
@info("Mean accuracy: $(round(acc, digits=3))")
