using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ISSMProjectMVC.Startup))]
namespace ISSMProjectMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
