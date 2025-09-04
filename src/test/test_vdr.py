import asyncio
from indy_vdr import open_pool

# Ruta a tu archivo genesis.txn
GENESIS_FILE = r"C:\Users\the19\Documents\SSI\src\red-indy\indy-node-container\run\lib_indy\UCSM\pool_transactions_genesis"

async def main():
    try:
        pool = await open_pool(transactions_path=GENESIS_FILE)
        print("✅ Conexión al pool UCSM exitosa")
        await pool.close()  # buena práctica cerrar el pool
    except Exception as e:
        print("❌ Error al conectar al pool:", e)

if __name__ == "__main__":
    asyncio.run(main())