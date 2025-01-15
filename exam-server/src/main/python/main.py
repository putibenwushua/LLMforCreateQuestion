import os
import time
import shutil
import dotenv
from langchain_community.document_loaders import PyPDFLoader, TextLoader, Docx2txtLoader
# from langchain_community.vectorstores import Chroma
from langchain_openai import OpenAIEmbeddings
from langchain_text_splitters import RecursiveCharacterTextSplitter
import sys
import hashlib
from langchain_chroma import Chroma
import sys
sys.stdout.reconfigure(encoding='utf-8')

# 加载 .env 文件
dotenv.load_dotenv()
# 获取环境变量
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
# 检查值是否正确
if OPENAI_API_KEY is None:
    raise ValueError("OPENAI_API_KEY is not set in the environment or .env file!")
# 如果需要设置环境变量
os.environ["OPENAI_API_KEY"] = OPENAI_API_KEY

#拼接找到的知识
def format_docs(docs):
    return "\n\n".join(doc.page_content for doc in docs)

def ensure_dir(directory):
    """
    确保目录存在。如果目录不存在，则创建它。
    :param directory: 目录的路径
    """
    dir = os.path.dirname(directory)

    if not os.path.exists(dir):
        os.makedirs(dir)

def calculate_file_hash(file_path):
    """计算文件的唯一哈希值，用于文件去重检测。"""
    hasher = hashlib.md5()
    with open(file_path, 'rb') as f:
        while chunk := f.read(8192):
            hasher.update(chunk)
    return hasher.hexdigest()

def create_chroma_db(db_name, source_file):
    """
    创建 Chroma 数据库。便于二次检索相关信息
    :param db_name: 数据库名称
    :param source_file: 文件路径
    """
    source_file_temp_save_path = str(time.time()) + os.path.basename(source_file)
    basedir = os.path.abspath(os.path.dirname(__file__))# 当前文件夹路径
    filepath = os.path.join(basedir, 'uploads', source_file_temp_save_path)# uploads是存放文件的子目录
    ensure_dir(filepath)#确保目录存在

    # save file
    shutil.copy(source_file, filepath)
    # print(source_file_temp_save_path)
    # 计算文件哈希值
    file_hash = calculate_file_hash(filepath)

    # 检查或创建数据库
    return create_db(db_name, filepath, file_hash)

def get_embeding_model():
    """获取嵌入模型"""
    return OpenAIEmbeddings(model = "text-embedding-3-small")

def load_db(persist_dir):
    """加载持久化的向量数据库"""
    embed_model = get_embeding_model()
    return Chroma(
        persist_directory=persist_dir,
        embedding_function=embed_model
    )


#创建知识库并持久化存储
def create_db(db_name,filepath, file_hash):
    """创建知识库并持久化存储"""
    persist_dir = f"./dbs/{db_name}_{file_hash}"  # 使用文件哈希值避免冲突
    if os.path.exists(persist_dir):
        # print(f"Database for file already exists at {persist_dir}, loading it.")
        return load_db(persist_dir)

    extension = filepath.split('.')[-1]
    loader = None
    if extension == 'pdf':
        loader = PyPDFLoader(filepath)
    elif extension == 'txt':
        loader = TextLoader(filepath, encoding="utf-8")
    elif extension == 'docx':
        loader = Docx2txtLoader(filepath)
    else:
        raise ValueError(f"Unsupported file extension: {extension}")


    # 加载并粗分（按照页）
    docs = loader.load_and_split()
    #切分
    text_splitter = RecursiveCharacterTextSplitter(
        chunk_size=500,
        chunk_overlap=200
    )
    splits = text_splitter.split_documents(docs)

    # 创建向量数据库
    vectorstore = Chroma(persist_directory=persist_dir, embedding_function=get_embeding_model())
    vectorstore.add_documents(splits)
    #delete temp file
    try:
        os.remove(filepath)
    except Exception as e:
        print(e)

    return vectorstore

def query_check(question, vectorstore):
    result = vectorstore.similarity_search(question, k=3)
    if result:
        formatted_result = format_docs(result)
        print(formatted_result)
        return formatted_result
    else:
        print("Error!Not Found relevant result")
        return 0

def main():
    # # 参数接收
    # 三个参数，分别是课程名称，文件目录，question
    if len(sys.argv) != 4:
        print("Usage: script.py <file_path> <question>")
        sys.exit(1)
    db_name = sys.argv[1]
    source_file = sys.argv[2]
    question = sys.argv[3]

    #test
    # db_name = "name of course"
    # source_file = "./test1.txt"
    # question = "什么是全扫描？"

    vectorstore = create_chroma_db(db_name, source_file)
    query_check(question, vectorstore)

    # 模拟处理逻辑并返回结果 这里采用的是python的输出台接收方式
    # answer = f"Answer to your question '{question}' from file '{file_path}'"
    # print(answer)  # 输出到标准输出，Java 程序会捕获
    sys.exit(0)


if __name__ == "__main__":
    main()

