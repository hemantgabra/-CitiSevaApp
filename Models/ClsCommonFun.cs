using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace CitySeva.Models
{
    public class ClsCommonFun
    {

        public bool DeleteFileFromFolder(string fileName, string filePath)
        {
            string file_name = fileName;
            string path = filePath;//Server.MapPath("files//" + file_name);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not  
            {
                file.Delete();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}