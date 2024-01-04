FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["STech/STechAPI.csproj", "STech/"]
COPY ["STech/STech.Core.csproj", "STech/"]
COPY ["STech/STech.Infrastructure.csproj", "STech/"]
RUN dotnet restore "STech/STech.csproj"
COPY . .
WORKDIR "/src/STech"
RUN dotnet build "STechAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "STechAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "STechAPI.dll"]
