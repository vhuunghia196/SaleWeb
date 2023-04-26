using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
namespace NiVi_Shop.Models
{
    public class PaypalLogger
    {
        public static string LogDirectoryPath = Environment.CurrentDirectory;
        public static void Log(String mesagges)
        {
            try
            {
                StreamWriter strw = new StreamWriter(LogDirectoryPath + "\\PaypalError.log", true);
                strw.WriteLine("{0}--->{1}",DateTime.Now.ToString("MM//dd//yyyy HH:mm:ss") + "--->" + mesagges);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}