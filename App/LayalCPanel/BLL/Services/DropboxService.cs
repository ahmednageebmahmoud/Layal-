using BLL.ViewModels;
using Dropbox.Api;
using Dropbox.Api.Files;
using Dropbox.Api.Sharing;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.Services
{
    public class DropboxService : IDisposable
    {
        string BasicPath = $"/Site/{DateTime.Now.Year}/{DateTime.Now.Month}/{DateTime.Now.Day}/";


        DropboxClient D;
        public DropboxService()
        {
            this.D = new DropboxClient(WebConfigService.Dropbox_AccessToken);
        }

        public void Dispose()
        {
            this.D.Dispose();
        }

        /// <summary>
        /// hglgth
        /// </summary>
        /// <param name="drf"></param>
        /// <param name="order"></param>
        public string UplaodFiles(List<OrderFileVM> drf, string folderName)
        {
            //Add Folder Name To Baisc Path
            BasicPath += folderName + "/";
            drf.ForEach(f =>
            {
                if (f.File != null)
                {
                    try
                    {
                        var UplaodFile = D.Files.UploadAsync(BasicPath + f.File.FileName, WriteMode.Overwrite.Instance, body: f.File.InputStream);
                        UplaodFile.Wait();
                        f.IsUplaoded = UplaodFile.IsCompleted && !string.IsNullOrEmpty(UplaodFile.Result.Id);
                        if (f.IsUplaoded)
                        {
                         //   f.DropboxFilePath = BasicPath + f.File.FileName;
                           // f.DropboxFileId = UplaodFile.Result.Id;
                        }
                    }
                    catch (Exception ex)
                    {
                        f.IsUplaoded = false;
                    }
                }
            });
            return BasicPath;
        }

        public List<DropboxThumbnailVM> GetDropboxFilesFromFolder(string dropboxFolderPath)
        {
            try
            {
                //Remove Last Slash
                if (dropboxFolderPath.EndsWith("/"))
                    dropboxFolderPath = dropboxFolderPath.Remove(dropboxFolderPath.Length - 1);
                var Files = D.Files.ListFolderAsync(dropboxFolderPath, limit: 1000);
                Files.Wait();
                var FilesThumbnail = D.Files.GetThumbnailBatchAsync(Files.Result.Entries.Where(c => !c.IsDeleted).Select(c => new
              ThumbnailArg(path: c.PathLower, size: ThumbnailSize.W256h256.Instance)).ToList());
                FilesThumbnail.Wait();

          return      FilesThumbnail.Result.Entries.Select(c => new DropboxThumbnailVM
          {
                    Id = c.AsSuccess.Value.Metadata.Id,
                    Thumbnail = "data:image/png;base64,"+ c.AsSuccess.Value.Thumbnail
                }).ToList() ;

            }
            catch (Exception ex)
            {
                return new List<DropboxThumbnailVM>();
            }

        }

    }//End CLass
}
