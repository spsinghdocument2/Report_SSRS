using System;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using Microsoft.Web.Administration;

namespace MAF.BAL
{
    public class VirtualDirectoryManager
    {
        public static bool CanRead(string path)
        {
            try
            {
                var readAllow = false;
                var readDeny = false;
               
                var accessControlList = Directory.GetAccessControl(path);
                if (accessControlList == null)
                    return false;
                var accessRules = accessControlList.GetAccessRules(true, true, typeof(System.Security.Principal.SecurityIdentifier));
                if (accessRules == null)
                    return false;

                foreach (FileSystemAccessRule rule in accessRules)
                {
                    if ((FileSystemRights.Read & rule.FileSystemRights) != FileSystemRights.Read) continue;

                    if (rule.AccessControlType == AccessControlType.Allow)
                        readAllow = true;
                    else if (rule.AccessControlType == AccessControlType.Deny)
                        readDeny = true;
                }
                return readAllow && !readDeny;
            }
            catch 
            {
                throw;
            }
        }

        public static bool IsExists(string path)
        {
            try
            {
                if (!Directory.Exists(path))
                    return false;
                return true;
            }
            catch
            {
                throw;
            }
        }

        public static void SetPhysicalPath(string siteName, string virtualDirectoryName, string path)
        {
            try
            {
                ServerManager serverManager = new ServerManager();

                // get the site (e.g. default)
                Site site = serverManager.Sites.FirstOrDefault(s => s.Name == siteName);
                // get the application that you are interested in
                if (site != null)
                {
                    Application myApp = site.Applications["/"];

                    // set the physical path of the virtual directory
                    myApp.VirtualDirectories["/" + virtualDirectoryName].PhysicalPath = path;
                }
                serverManager.CommitChanges();
            }
            catch
            {
                throw;
            }
        }

        public static string GetPhysicalPath(string siteName, string virtualDirectoryName)
        {
            string physicalPath = string.Empty;
            try
            {
                ServerManager serverManager = new ServerManager();

                // get the site (e.g. default)
                Site site = serverManager.Sites.FirstOrDefault(s => s.Name == siteName);
                // get the application that you are interested in
                if (site != null)
                {
                    Application myApp = site.Applications["/"];

                    // set the physical path of the virtual directory
                    physicalPath = myApp.VirtualDirectories["/" + virtualDirectoryName].PhysicalPath;
                }
                //serverManager.CommitChanges();
                return physicalPath;
            }
            catch
            {
                throw;
            }
        }
    }
}
