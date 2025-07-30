from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    # write_file.py
    with open('C:\POCs\mounteddockerfiles\data\hello.txt', 'w') as f:
        f.write('Hello from Docker!')

    return {"message": "Hello, World v2!"}
