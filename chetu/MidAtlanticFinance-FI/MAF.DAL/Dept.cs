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
    
    public partial class Dept
    {
        public Dept()
        {
            this.Dept2ext = new HashSet<Dept2ext>();
        }
    
        public int idDept { get; set; }
        public string name { get; set; }
    
        public virtual ICollection<Dept2ext> Dept2ext { get; set; }
    }
}
