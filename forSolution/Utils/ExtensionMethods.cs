using Showcase.Web.DB;
using System.Linq;

namespace Showcase.Web.Utils
{
    public static class ExtensionMethods
    {
        public static (string, string, string, int) ToTouple(this PageContent item)
        {
            return (item.ItemName, item.ItemDescription, item.ItemContent, item.ItemOrder ?? 0);
        }

        public static string GetUserFullNameIfExists(this aboutMeContext dbLink)
        {
            return dbLink.MyInfos
                .FirstOrDefault(x => x.InfoName == Constants.UserFullNameKey)
                ?.InfoDetail;
        }
    }
}

