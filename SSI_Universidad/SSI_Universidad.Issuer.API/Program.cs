using Hyperledger.Aries.Extensions;
using Hyperledger.Aries.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Configuración para RED REAL (no modo simulado)
builder.Services.AddAriesFramework(builder.Configuration);






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
