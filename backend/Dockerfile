# Use the .NET 9.0 preview SDK image
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy and restore dependencies
COPY MoviesHubApi/*.csproj ./MoviesHubApi/
RUN dotnet restore MoviesHubApi/MoviesHubApi.csproj

# Copy the project and build
COPY MoviesHubApi/. ./MoviesHubApi/
WORKDIR /app/MoviesHubApi
RUN dotnet publish -c Release -o /publish

# Use a lightweight runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /publish .

# Expose API port
EXPOSE 5000
EXPOSE 5001

# Run the API
ENTRYPOINT ["dotnet", "MoviesHubApi.dll"]