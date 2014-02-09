using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Runtime.Serialization;

namespace SH.Entity
{

    [Serializable]
    [DataContract(Name = "AutoCompleteEntity", Namespace = "http://www.GW2.com/types")]
    public partial class AutoCompleteEntity : BaseEntity
    {
        #region Properties

  
        public long? AutoID { get; set; }
        public string AutoValue { get; set; }
        public int? AutoIntValue { get; set; }
        public Boolean? AutoBooleanValue { get; set; }
        public DateTime? AutoDateTimeValue { get; set; }

        #endregion

        #region Constructor

        public AutoCompleteEntity()
            : base()
        {
        }

        

        #endregion
    }

    
}
