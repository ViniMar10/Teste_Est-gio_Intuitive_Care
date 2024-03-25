#TESTE 2 - TESTE DE TRANSFORMAÇÃO DE DADOS

import os
import zipfile
from tabula import read_pdf
import PyPDF2
import pandas as pd

with zipfile.ZipFile("downloaded_pdfs.zip",'r') as zipf:
    #extracting Anexo I from the zip file created after carrying out the first test
    zipf.extract("Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf")

#Creating a function to remove pages that don't have a table from the pdf
def remove_page_from_pdf(input_pdf,output_pdf,page_number):
    with open(input_pdf,'rb') as file:
        reader = PyPDF2.PdfReader(file)
        writer = PyPDF2.PdfWriter()

        for page_index in range (len(reader.pages)):
            if page_index != page_number:
                writer.add_page(reader.pages[page_index])

        with open(output_pdf,'wb') as output_file:
            writer.write(output_file)

#Making use of the function to remove the pages that are not necessary
remove_page_from_pdf('Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf','Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf',0)
remove_page_from_pdf('Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf','Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf',0)

#Reading the pdf with tabula
tables = read_pdf('Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf',pages='all',multiple_tables=True)

#concatenate the tables
df_concatenated=pd.concat(tables,ignore_index=True)

#turning the concatenated tables into a csv file
df_concatenated.to_csv("AnexoI.csv",index=False)

#Renaming the OD column
df = pd.read_csv('AnexoI.csv')
df.rename(columns={'OD':'Seg. Odontológica'},inplace=True)
df.to_csv('AnexoI.csv',index=False)
#Renaming the AMB column
df.rename(columns={'AMB':'Seg. Ambulatorial'},inplace=True)
df.to_csv('AnexoI.csv',index=False)

#Deleting the extracted pdf
os.remove('Anexo_I_Rol_2021RN_465.2021_RN599_RN600.pdf')

#Compressing the csv into a zip file
with zipfile.ZipFile("Teste_Vinicius_Martins.zip",'w') as zipf:
    zipf.write("AnexoI.csv")

#Deleting the original csv after compressing it into a zip
os.remove('AnexoI.csv')