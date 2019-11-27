using BLL.Enums;
using Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ViewModels
{
    public class ResponseVM
    {
        public RequestTypeEnum RequestType { get; set; }
        public string Message { get; set; }

        public bool IsData { get; set; }
        public object Result { get; set; }
        public object DevMessage { get; set; }

        public string DevInnerException { get; set; }
        public ResponseVM(RequestTypeEnum requestType, string message, object data)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.Result = data;
            this.IsData = data == null ? false : true;
        }

        public ResponseVM(RequestTypeEnum requestType, string message, Exception ex)
        {
            this.RequestType = requestType;
            this.Message = message;
            this.DevMessage = ex.Message;
            this.DevInnerException = ex.InnerException == null ? null : ex.InnerException.Message;
        }
        public ResponseVM(RequestTypeEnum requestType, string message)
        {
            this.RequestType = requestType;
            this.Message = message;

        }
        public ResponseVM()
        {

        }
        /// <summary>
        /// Response Error
        /// </summary>
        /// <param name="message"></param>
        /// <returns></returns>
        static public ResponseVM Error(string message)
        {
            return new ResponseVM
            {
                RequestType = RequestTypeEnum.Error,
                Message = message,
            };
        }

        internal static ResponseVM Error(string message, Exception ex)
        {
            return new ResponseVM
            {
                RequestType = RequestTypeEnum.Error,
                Message = message,
                DevMessage = ex.Message,
                DevInnerException = ex.InnerException == null ? null : ex.InnerException.Message,
            };
        }

        public static ResponseVM Success(string message, object data)
        {
            return new ResponseVM
            {
                RequestType = RequestTypeEnum.Success,
                Message = message,
                Result = data
            };
        }

        public static ResponseVM Success(object data)
        {
            return new ResponseVM
            {
                RequestType = RequestTypeEnum.Success,
                Message = Token.Success,
                Result=data
            };
        }

        internal static object Success()
        {
            return new ResponseVM
            {
                RequestType = RequestTypeEnum.Success,
                Message = Token.Success
            };
        }
    }
}
