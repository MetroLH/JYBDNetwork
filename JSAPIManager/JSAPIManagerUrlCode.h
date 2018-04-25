//
//  JSAPIManagerUrlCode.h
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#ifndef JSAPIManagerUrlCode_h
#define JSAPIManagerUrlCode_h

typedef NS_ENUM(NSInteger, JSApiManagerUrlCode) {
    //客户模块
    ClientChainListApiCode,                                 //代下单客户列表
    ClientChainDetailsApiCode,                              //代下单客户详情
    ClientGoodsListApiCode,                                 //代下单商品列表
    ClientShoppingCarNumApiCode,                            //获取购物车物品数量
    ClientShoppingCarAddApiCode,                            //添加购物车
    ClientShoppingCarListApiCode,                           //获取购物车列表
    ClientShoppingCarDeleteApiCode,                         //购物车删除
    ClientSubmitOrderApiCode,                               //客户提交订单
    ClientGetOrderInfoApiCode,                              //获取订单详情
    ClientSumbitOrderPriceApiCode,                          //订单价格计算
    ClientInvoiceListApiCode,                               //获取发票列表
    ClientInvoiceInfoListApiCode,                           //获取发票内容列表
    AddClientInvoiceApiCode,                                //添加发票
    ClientInvoiceDeleteApiCode,                             //删除发票
    ClientOrderShareUrlApiCode,                             //生成订单分享内容链接
    ClientShareQrcodeApiCode,                               //生成分享二维码
    EditClientShoppingCarNum,
    
    //首页模块
    GetPhoneInfoApiCode,                                    //获取客服联系方式
    GetOrderTypeCountApiCode,                               
    GetMsgCountApiCode,
    StoreInfoApiCode,
    AboutUsApiCode,
    ImportanceCountApiCode,
    FeedBackApiCode,
    GetGoodsApiCode,
    CheckAppVersionApiCode,
    
    //订单模块
    GetOrderApiCode,
    GoodsChukuApiCode,
    GetOrderDetailApiCode,
    GetOrderPfDetailApiCode,
    GetOrderSourceDetailApiCode,
    SetDefaultAddressApiCode,
    SendAddressApiCode,
    SetSendGoodsApiCode,
    GetAddressListApiCode,
    DeleteAddressApiCode,
    GetLogisticsListApiCode,
    GetDeliverGoodsInfoApiCode,
    AddDeliverAddressApiCode,
    EditDeliverAddressApiCode,
    
    
    //服务模块
    CarRefundListApiCode,
    ChainReturnListApiCode,
    CarReturnListApiCode,
    StoreRefundListApiCode,
    ChainRefundListApiCode,
    CarReceiveApiCode,
    StoreOrChainReceiveApiCode,
    CarRefundDetailsApiCode,
    CarReturnDetailsApiCode,
    StoreRefundDetailsApiCode,
    ChainRefundDetailsApiCode,
    ChainReturnDetailsApiCode,
    CarRefundApplyApiCode,
    ChainRefundApplyApiCode,
    CommitCarRefundApplyApiCode,
    CommitChainRefundApplyApiCode,
    CarReturnApplyApiCode,
    ChainReturnApplyApiCode,
    CommitCarReturnApplyApiCode,
    CommitChainReturnApplyApiCode,
    CarReturnEditApiCode,
    
    //消息模块
    NoticeCountApiCode,
    GoodsDcdApiCode,
    GoodsDcdSendApiCode,
    GoodsDcdDeleteApiCode,
    GoodsDcdModifyApiCode,
    GoodsDcdAreaApiCode,
    GoodsDcdAddApiCode,
    GoodsDcdDetailApiCode,
    NoticeListApiCode,
    MessageDetailApiCode,
    GetGoodsDcdTypeApiCode,
    
    //商品模块
    GoodsSellingListApiCode,
    GoodsOthersListApiCode,
    GoodsPutawayListApiCode,
    GoodsSoldOutListApiCode,
    GoodsDeleteListApiCode,
    GoodsSkuListApiCode,
    GoodsModifySpecApiCode,
    GoodsBatchModifySpecApiCode,
    GoodsAdvertEditApiCode,
    GoodsClassApiCode,
    
    //结算模块
    SettleListApiCode,
    OwnersBillDetailsApiCode,
    OwnersBillConfirmApiCode,
    ShopBillDetailsApiCode,
    TradeBillDetailsApiCode,
    ShopOrTradeBillConfirmApiCode,
    
    //用户模块
    LoginApiCode,
    AuthcodeApiCode,
    PhoneNumVerifyApiCode,
    RegisterApiCode,
    UploadRegisterPictureApiCode,
    UploadIconApiCode,
    UploadDeliverPictureApiCode,
    StoreCategoryApiCode,
    ManagementCategoryApiCode,
    SubmitStoreInfoApiCode,
    PullStoreInfoApiCode,
    ResetPassWordApiCode,
    GetSalesmanListApiCode,
    GetAreaListApiCode,
    VerifyRegisterUserNameApiCode,
    UpdateTokenApiCode,
    
    //数据收集模块
    CollectApiCode,
    CollectDeviceInfoApiCode,
    //Salesman模块
    GetSalesmanInfoApiCode,
    GetSalesmanAchievementApiCode,
    SubmitSalesmanSignStateApiCode,
    GetSalesmanOrderListApiCode,
    GetSalesmanPackInfoApiCode,//业务员合同接口
    
    //我的钱包
    GetSellerWalletApiCode,     //我的钱包
    GetBankInfoApiCode,         //识别银行卡信息
    GetCashBankInfoApiCode,     //判断是否绑卡，已绑则返回卡信息
    GetBankCardNameApiCode,     //根据银行卡号获取银行名称
    bindingCardApiCode,         //业务员绑定或更绑银行卡
    getBankListApiCode,         //获取连连银行卡列表
    SalesmanCashAddApiCode,     //申请提现
    CashDetailListApiCode,      //我的钱包明细
    TaxListApiCode,             //结算单列表
    TaxDetailApiCode,           //结算单详情
};

#endif /* JSAPIManagerUrlCode_h */
