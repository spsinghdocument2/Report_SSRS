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
    
    public partial class chat_dest2chat_mess
    {
        public int id_chat_dest2chat_mess { get; set; }
        public int fk_id_chat_mess { get; set; }
        public string to_no { get; set; }
        public string to_name { get; set; }
        public bool is_visibleto_src { get; set; }
        public bool is_visibleto_tono { get; set; }
        public bool received { get; set; }
    }
}