#TESTE 1 - TESTE DE WEB SCRAPING

from bs4 import BeautifulSoup
import os
import urllib.request
import requests
import zipfile

html = requests.get("https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos").content

soup = BeautifulSoup(html,'html.parser')

#find all <a> tags cotaining the text 'Anexo I' and 'Anexo II.'
pdf_links = soup.find_all("a",href= lambda href:(href and href.endswith(".pdf")),string=['Anexo I','Anexo II.'])

#Creating a directory to keep the downloaded pdfs
downloaded_pdfs = "downloaded_pdfs"
if not os.path.exists(downloaded_pdfs):
    os.mkdir(downloaded_pdfs)

#Downloading the pdfs
for link in pdf_links:
    pdf_url=link.get("href")
    file_name = pdf_url.split('/')[-1]
    file_path = os.path.join(downloaded_pdfs, file_name)
    urllib.request.urlretrieve(pdf_url,file_path)
    print(f"Downloaded: {file_name}")

#Compressing downloaded pdfs into a zip
with zipfile.ZipFile("downloaded_pdfs.zip", 'w') as zipf:
    for folder, subfolders, files in os.walk(downloaded_pdfs):
        for file in files:
            zipf.write(os.path.join(folder, file), os.path.relpath(os.path.join(folder, file), downloaded_pdfs))

print(f"Files downloaded and compressed into downloaded_pdfs.zip")

#Deleting the original pdfs after compressing them into a zip file
for folder,subfolders,files in os.walk(downloaded_pdfs):
    for file in files:
        os.remove(os.path.join(folder,file))
os.rmdir(downloaded_pdfs)