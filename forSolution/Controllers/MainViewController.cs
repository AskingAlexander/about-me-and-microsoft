using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Showcase.Web.DB;
using Showcase.Web.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Showcase.Web.Controllers
{
    public class MainViewController : Controller
    {
        private readonly aboutMeContext _context;

        public MainViewController(aboutMeContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> ProfileTemplate()
        {
            var pageData = await _context.MyInfos
                .ToListAsync();
            List<(string, string, int)> links = new();

            foreach (MyInfo currentElement in pageData)
            {
                string itemKey = currentElement.InfoName;

                if (itemKey.Contains(Constants.UserLinksKey))
                {
                    string linkTitle = itemKey.Replace(Constants.UserLinksKey, "");
                    links.Add((linkTitle, currentElement.InfoName, currentElement.InfoOrder));
                }
                else
                {
                    ViewData[itemKey] = currentElement.InfoDetail;
                }
            }

            if (links.Count > 0)
            {
                ViewData[Constants.UserLinksKey] = links;
            }

            return View();
        }

        public async Task<IActionResult> TableTemplatePage(int tableId)
        {
            string versionS = _context.MyInfos
                .FirstOrDefault(x => x.InfoName == Constants.VersionKey)
                ?.InfoDetail;
            int? versionNumber = string.IsNullOrEmpty(versionS)
                ? null
                : Convert.ToInt32(versionS);

            var pageData = await _context.PageContents
                .FromSqlInterpolated($"exec GetElementsForVersion {versionNumber}")
                .ToListAsync();

            pageData = pageData.Where(x => x.NavigationId == tableId)
                .ToList();

            List<(string, string, string, int)> contentForVeiw = new();
            foreach (PageContent currentElement in pageData)
            {
                contentForVeiw.Add(currentElement.ToTouple());
            }
            if (contentForVeiw.Count > 0)
            {
                ViewData[Constants.PageContentKey] = contentForVeiw;
            }

            ViewData[Constants.UserFullNameKey] = _context.GetUserFullNameIfExists();

            return View();
        }
    }
}
