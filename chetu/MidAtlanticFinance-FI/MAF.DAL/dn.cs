//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MAF.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class dn
    {
        public dn()
        {
            this.specialmenus = new HashSet<specialmenu>();
        }
    
        public int iddn { get; set; }
        public int status { get; set; }
        public string value { get; set; }
        public int fkidtenant { get; set; }
    
        public virtual ICollection<specialmenu> specialmenus { get; set; }
    }
}
