//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyPets.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserInfo()
        {
            this.BaikeAnswer = new HashSet<BaikeAnswer>();
            this.BaikeQuestion = new HashSet<BaikeQuestion>();
            this.Collect = new HashSet<Collect>();
            this.GoodsComment = new HashSet<GoodsComment>();
            this.Order = new HashSet<Order>();
            this.OrderDetail = new HashSet<OrderDetail>();
            this.Post = new HashSet<Post>();
            this.Shop = new HashSet<Shop>();
        }
    
        public int UserId { get; set; }
        public string UserPhone { get; set; }
        public string UserEmail { get; set; }
        public string UserName { get; set; }
        public string UserPwd { get; set; }
        public string ConfirmPwd { get; set; }
        public string UserImg { get; set; }
        public bool IsSeller { get; set; }
        public string Range { get; set; }
        public Nullable<int> Score { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaikeAnswer> BaikeAnswer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaikeQuestion> BaikeQuestion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Collect> Collect { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GoodsComment> GoodsComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Post> Post { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Shop> Shop { get; set; }

        public static implicit operator int(UserInfo v)
        {
            throw new NotImplementedException();
        }
    }
}
