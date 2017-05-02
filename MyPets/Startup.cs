using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MyPets.Startup))]
namespace MyPets
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
