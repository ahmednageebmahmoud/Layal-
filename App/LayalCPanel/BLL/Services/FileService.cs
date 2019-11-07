using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http.Headers;
using System.IO;
using System.Web;
using BLL.ViewModels;
using System.Text.RegularExpressions;

namespace BLL.Services
{
    public class FileService
    {

        public static FileSaveVM SaveFile(FileSaveVM file)
        {
            try
            {

                file.FileBase64= Regex.Replace(file.FileBase64, @"data:[A-z]*\/[A-z]*;base64,", string.Empty);

                file.SavedPath =  "Image" +Guid.NewGuid().ToString() +Path.GetExtension(file.FileName);
     
                System.IO.File.WriteAllBytes(HttpContext.Current.Server.MapPath(file.ServerPathSave) + file.SavedPath, Convert.FromBase64String(file.FileBase64));

                file.SavedPath = file.ServerPathSave + file.SavedPath;
                file.IsSaved = true;
                return file;
            }
            catch (Exception ex)
            {
                file.IsSaved = false;
                return file;
            }
        }

        public static FileSaveVM SaveFileHttpBase(FileSaveVM file)
        {
            try
            {


                file.SavedPath = "Image" + Guid.NewGuid().ToString() + Path.GetExtension(file.File.FileName);

                file.File.SaveAs(HttpContext.Current.Server.MapPath(file.ServerPathSave) + file.SavedPath);
                file.SavedPath = file.ServerPathSave + file.SavedPath;
                file.IsSaved = true;
                return file;
            }
            catch (Exception ex)
            {
                file.IsSaved = false;
                return file;
            }
        }

        //internal static FileSaveVM SaveFileBase(FileSaveVM file)
        //{
        //    try
        //    {
        //        file.SavedPath = Path.GetFileName(file.File.FileName) + new Random().Next().ToString() + Path.GetExtension(file.File.FileName);

        //        file.File.SaveAs(HttpContext.Current.Server.MapPath(file.ServerPathSave) + file.SavedPath);

        //        file.SavedPath = file.ServerPathSave + file.SavedPath;
        //        file.IsSaved = true;
        //        return file;
        //    }
        //    catch (Exception ex)
        //    {
        //        file.IsSaved = false;
        //        return file;
        //    }
        //}

        public static void RemoveFile(string oldImageUrl)
        {
            try
            {
                System.IO.File.Delete(HttpContext.Current.Server.MapPath(oldImageUrl));
            }
            catch (Exception ex)
            {

            }

            }

        public static void RemoveFiles(List<string> imagesRemove)
        {
            try
            {
                foreach (var item in imagesRemove)
                {
                    if(item!=null)
                    RemoveFile(item);
                }
            }
            catch (Exception ex)
            {

            }
      
        }
        public static void RemoveFilesAPI(List<string> imagesRemove)
        {
            try
            {
                foreach (var item in imagesRemove)
                {
                    if (item != null)
                        RemoveFile(HttpContext.Current.Server.MapPath(item));
                }

            }
            catch (Exception ex)
            {

            }

        }

    }//End Class
}
