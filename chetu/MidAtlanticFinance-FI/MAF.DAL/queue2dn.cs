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
    
    public partial class queue2dn
    {
        public int fkidqueue { get; set; }
        public int fkiddn { get; set; }
        public int priority { get; set; }
        public int idqueue2dn { get; set; }
        public bool IsActive { get; set; }
        public bool IsManager { get; set; }
    }
}
