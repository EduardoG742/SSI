using Hyperledger.Aries;
using Hyperledger.Aries.Configuration;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Configuración para RED REAL de Aries (no modo simulado)
builder.Services.AddAriesFramework(options =>
{
    // Enalzar "Agent" de appsettings.json con las opciones de Aries
    builder.Configuration.GetSection("Agent").Bind(options);
});

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
