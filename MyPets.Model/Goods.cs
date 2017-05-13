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
    
    public partial class Goods
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Goods()
        {
            this.GoodsComment = new HashSet<GoodsComment>();
            this.OrderDetail = new HashSet<OrderDetail>();
        }
    
        public int GoodsId { get; set; }
        public string GoodsName { get; set; }
        public string SeriesName { get; set; }
        public string TypeName { get; set; }
        public string DetailName { get; set; }
        public string GoodsImg1 { get; set; }
        public string GoodsImg2 { get; set; }
        public string GoodsImg3 { get; set; }
        public string GoodsImg4 { get; set; }
        public decimal GoodsPrice { get; set; }
        public string GoodsDescribe { get; set; }
        public bool IsDiscount { get; set; }
        public Nullable<decimal> DiscountPrice { get; set; }
        public int GoodsStock { get; set; }
        public int ShopId { get; set; }
        public Nullable<int> SellNum { get; set; }
        public string GoodsRange { get; set; }
    
        public virtual Shop Shop { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GoodsComment> GoodsComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
    }
}
