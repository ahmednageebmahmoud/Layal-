using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;
using System.Collections.Concurrent;
using BLL.BLL;
using BLL.ViewModels;
using BLL.Services;

namespace BLL.SignalAr
{
     
    public class NotificationHub : Hub
    {
      //  NotificationBLL _NotificationBLL = new NotificationBLL();
        //store connection id's of user in memory storge
        private static readonly ConcurrentDictionary<string, UserHub> Users =
           new ConcurrentDictionary<string, UserHub>(StringComparer.InvariantCultureIgnoreCase);

        UsersBLL UserBLL = new UsersBLL();

        /// <summary>
        /// (ANageeb) 
        /// Send One Notification To Spcifc Users
        /// </summary>
        /// <param name="userIds"></param>
        /// <param name="notify"></param>
        public void SendNotificationToSpcifcUsers(List<long> userIds, NotifyVM notify)
        {
            try
            {

                //Send To
                UserHub receiver;
                userIds.ForEach(usId =>
                {
                    if (Users.TryGetValue(usId.ToString(), out receiver))
                    {
                        var cid = receiver.ConnectionIds.ToList();
                        var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                        if (cid.Count() > 0)
                        {
                            foreach (var connection in cid)
                                context.Clients.Client(connection).showNotify(notify);
                        }
                    }
                });
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        /// <summary>
        /// (ANageeb) 
        /// Send One Notification To Spcifc User
        /// </summary>
        /// <param name="userIds"></param>
        /// <param name="notify"></param>
        public void SendNotificationToSpcifcUsers(long userId, NotifyVM notify)
        {
            try
            {

                //Send To
                UserHub receiver;
                    if (Users.TryGetValue(userId.ToString(), out receiver))
                    {
                        var cid = receiver.ConnectionIds.ToList();
                        var context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                        if (cid.Count() > 0)
                        {
                            foreach (var connection in cid)
                                context.Clients.Client(connection).showNotify(notify);
                        }
                    }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public override Task OnConnected()
        {
            string UserId= CookieService.UserInfo.Id.ToString();
            //sp to get id using mail
            string connectionId = Context.ConnectionId;

            var user = Users.GetOrAdd(UserId, _ => new UserHub
            {
                UserId = UserId,
                ConnectionIds = new HashSet<string>()
            });

            lock (user.ConnectionIds)
            {
                user.ConnectionIds.Add(connectionId);
                if (user.ConnectionIds.Count == 1)
                {
                    Clients.Others.userConnected(UserId);
                }
            }

            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            string UserId = CookieService.UserInfo.Id.ToString();
            //sp to get id using mail
            string connectionId = Context.ConnectionId;

            UserHub user;
            Users.TryGetValue(UserId, out user);

            if (user != null)
            {
                lock (user.ConnectionIds)
                {
                    user.ConnectionIds.RemoveWhere(cid => cid.Equals(connectionId));
                    if (!user.ConnectionIds.Any())
                    {
                        UserHub removedUser;
                        Users.TryRemove(UserId, out removedUser);
                        Clients.Others.userDisconnected(UserId);
                    }
                }
            }

            return base.OnDisconnected(stopCalled);
        }

    }
}