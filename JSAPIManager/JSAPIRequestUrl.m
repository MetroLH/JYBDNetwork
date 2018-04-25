//
//  JSAPIRequestUrl.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//  url请求路径设置

#import "JSAPIRequestUrl.h"

@implementation JSAPIRequestUrl

+ (NSString*)getURL:(JSApiManagerUrlCode)code urlParam:(NSDictionary *)urlParam{
    switch (code) {
            //////////////////////代下单模块//////////////////////////
        case ClientChainListApiCode:
            return @"storeapi/index.php?act=t_bindchain&op=chain_list";
            break;
        case ClientGoodsListApiCode:
            return @"storeapi/index.php?act=t_goods&op=goods_list";
            break;
        case ClientChainDetailsApiCode:
            return @"storeapi/index.php?act=t_bindchain&op=chain_detail";
            break;
        case ClientShoppingCarNumApiCode:
            return @"storeapi/index.php?act=t_cart&op=cart_count";
            break;
        case ClientShoppingCarAddApiCode:
            return @"storeapi/index.php?act=t_cart&op=cart_add";
            break;
        case ClientShoppingCarListApiCode:
            return @"storeapi/index.php?act=t_cart&op=cart_list";
            break;
        case ClientShoppingCarDeleteApiCode:
            return @"storeapi/index.php?act=t_cart&op=cart_del";
            break;
        case ClientSubmitOrderApiCode:
            return @"storeapi/index.php?act=t_buy&op=buy_step2";
            break;
        case ClientGetOrderInfoApiCode:
            return @"storeapi/index.php?act=t_buy&op=buy_step1";
            break;
        case ClientSumbitOrderPriceApiCode:
            return @"storeapi/index.php?act=t_buy&op=buy_orderprice";
            break;
        case ClientInvoiceListApiCode:
            return @"storeapi/index.php?act=t_invoice&op=invoice_list";
            break;
        case ClientInvoiceInfoListApiCode:
            return @"storeapi/index.php?act=t_invoice&op=invoice_content_list";
            break;
        case AddClientInvoiceApiCode:
            return @"storeapi/index.php?act=t_invoice&op=invoice_add";
            break;
        case ClientInvoiceDeleteApiCode:
            return @"storeapi/index.php?act=t_invoice&op=invoice_del";
            break;
        case ClientOrderShareUrlApiCode:
            return @"storeapi/index.php?act=t_buy&op=payurl";
            break;
        case ClientShareQrcodeApiCode:
            return @"storeapi/index.php?act=t_bindchain&op=qrcode";
            break;
        case EditClientShoppingCarNum:
            return @"storeapi/index.php?act=t_cart&op=cart_edit";
            break;
        case GetSalesmanListApiCode:
            return @"storeapi/index.php?act=yewuyuan&op=list";
            break;
            //////////////////////首页模块//////////////////////////
        case GetPhoneInfoApiCode:
            return @"storeapi/index.php?act=setting&op=getphone";
            break;
        case GetOrderTypeCountApiCode:
            return @"storeapi/index.php?act=login&op=countOrder";
            break;
        case GetMsgCountApiCode:
            return @"storeapi/index.php?act=login&op=msgCount";
            break;
        case StoreInfoApiCode:
            return @"storeapi/index.php?act=store_info&op=store_info";
            break;
        case AboutUsApiCode:
            return @"storeapi/index.php?act=setting&op=about_us";
            break;
        case ImportanceCountApiCode:
            return @"storeapi/index.php?act=store_msg&op=msg_count";
            break;
        case FeedBackApiCode:
            return @"storeapi/index.php?act=store_info&op=feedback";
            break;
        case GetGoodsApiCode:
            return @"storeapi/index.php?act=store_message&op=getgood";
            break;
        case CheckAppVersionApiCode:
            return [NSString stringWithFormat:@"storeapi/index.php?act=version&op=app_version&terminal=iOS&version=%@",VERSION];
            break;
            
            //////////////////////订单模块//////////////////////////
        case GetOrderApiCode:
            return @"storeapi/index.php?act=store_order&op=order_list";
            break;
        case GoodsChukuApiCode:
            return @"storeapi/index.php?act=store_order&op=chuku";
            break;
        case GetOrderDetailApiCode:
            return @"storeapi/index.php?act=store_order&op=order_detail";
            break;
        case GetOrderPfDetailApiCode:
            return @"storeapi/index.php?act=store_order&op=order_pf_detail";
            break;
        case GetOrderSourceDetailApiCode:
            return @"storeapi/index.php?act=store_order&op=order_source_detail";
            break;
        case GetAddressListApiCode:
            return @"storeapi/index.php?act=store_deliver&op=send_list";
            break;
        case DeleteAddressApiCode:
            return @"storeapi/index.php?act=store_deliver&op=del_addr";
            break;
        case SetDefaultAddressApiCode:
            return @"storeapi/index.php?act=store_deliver&op=default_addr";
            break;
        case SendAddressApiCode:
            return @"storeapi/index.php?act=store_deliver&op=send_info";
            break;
        case SetSendGoodsApiCode:
            return @"storeapi/index.php?act=store_deliver&op=send_save";
            break;
        case GetLogisticsListApiCode:
            return @"storeapi/index.php?act=store_deliver&op=express_list";
            break;
        case AddDeliverAddressApiCode:
            return @"storeapi/index.php?act=store_deliver&op=add_addr";
            break;
        case EditDeliverAddressApiCode:
            return @"storeapi/index.php?act=store_deliver&op=edit_addr";
            break;
        case GetDeliverGoodsInfoApiCode:
            return @"storeapi/index.php?act=store_deliver&op=deliver_info";
            break;
            
            //////////////////////服务模块//////////////////////////
        case CarRefundListApiCode:
            return @"storeapi/index.php?act=store_refund&op=index";
            break;
        case ChainReturnListApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=return_list";
            break;
        case CarReturnListApiCode:
            return @"storeapi/index.php?act=store_return&op=index";
            break;
        case StoreRefundListApiCode:
            return @"storeapi/index.php?act=store_pf_refund&op=index";
            break;
        case ChainRefundListApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=refund_list";
            break;
        case CarReceiveApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=store_return&op=receive"];
            break;
        case StoreOrChainReceiveApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=chain_aftersale&op=return_receive"];
            break;
        case CarRefundDetailsApiCode:
            return @"storeapi/index.php?act=store_refund&op=view";
            break;
        case CarReturnDetailsApiCode:
            return @"storeapi/index.php?act=store_return&op=view";
            break;
        case StoreRefundDetailsApiCode:
            return @"storeapi/index.php?act=store_pf_refund&op=view";
            break;
        case ChainRefundDetailsApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=refund_detail";
            break;
        case ChainReturnDetailsApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=return_detail";
            break;
        case CarRefundApplyApiCode:
            return @"storeapi/index.php?act=store_refund&op=edit";
            break;
        case ChainRefundApplyApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=refund_edit";
            break;
        case CommitCarRefundApplyApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=store_refund&op=edit"];
            break;
        case CommitChainRefundApplyApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=chain_aftersale&op=refund_edit"];
            break;
        case CarReturnApplyApiCode:
            return @"storeapi/index.php?act=store_return&op=edit";
            break;
        case ChainReturnApplyApiCode:
            return @"storeapi/index.php?act=chain_aftersale&op=return_edit";
            break;
        case CommitCarReturnApplyApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=store_return&op=edit"];
            break;
        case CommitChainReturnApplyApiCode:
            return [JSAPIRequestUrl getParameters:urlParam rootUrl:@"storeapi/index.php?act=chain_aftersale&op=return_edit"];
            break;
            
            //////////////////////消息模块//////////////////////////
        case NoticeCountApiCode:
            return @"storeapi/index.php?act=store_msg&op=msg_count";
            break;
        case GoodsDcdApiCode:
            return @"storeapi/index.php?act=store_message&op=list";
            break;
        case GoodsDcdSendApiCode:
            return @"storeapi/index.php?act=store_message&op=send_goods_message";
            break;
        case GoodsDcdDeleteApiCode:
            return @"storeapi/index.php?act=store_message&op=message_del";
            break;
        case GoodsDcdModifyApiCode:
            return @"storeapi/index.php?act=store_message&op=message_save";
            break;
        case GoodsDcdAreaApiCode:
            return @"storeapi/index.php?act=store_message&op=getarea";
            break;
        case GoodsDcdAddApiCode:
            return @"storeapi/index.php?act=store_message&op=message_add";
            break;
        case GoodsDcdDetailApiCode:
            return @"storeapi/index.php?act=store_message&op=message_view";
            break;
        case NoticeListApiCode:
            return @"storeapi/index.php?act=store_msg&op=msg_list";
            break;
        case MessageDetailApiCode:
            return @"storeapi/index.php?act=store_msg&op=mark_as_read";
            break;
        case GetGoodsDcdTypeApiCode:
            return @"storeapi/index.php?act=store_message&op=get_goods_message_type";
            break;
            //////////////////////商品模块//////////////////////////
        case GoodsSellingListApiCode:
            return @"storeapi/index.php?act=store_goods_online&op=goods_list";
            break;
        case GoodsOthersListApiCode:
            return @"storeapi/index.php?act=store_goods_offline&op=goods_storage";
            break;
        case GoodsPutawayListApiCode:
            return @"storeapi/index.php?act=store_goods_offline&op=goods_show";
            break;
        case GoodsSoldOutListApiCode:
            return @"storeapi/index.php?act=store_goods_online&op=goods_unshow";
            break;
        case GoodsDeleteListApiCode:
            return @"storeapi/index.php?act=store_goods_online&op=drop_goods";
            break;
        case GoodsSkuListApiCode:
            return @"storeapi/index.php?act=store_goods_offline&op=goods_sku_list";
            break;
        case GoodsModifySpecApiCode:
            return @"storeapi/index.php?act=store_goods_offline&op=change_goods_price";
            break;
        case GoodsBatchModifySpecApiCode:
            return @"storeapi/index.php?act=store_goods_offline&op=change_goods_price_batch";
            break;
        case GoodsAdvertEditApiCode:
            return @"storeapi/index.php?act=store_goods_online&op=edit_jingle";
            break;
        case GoodsClassApiCode:
            return @"storeapi/index.php?act=store_goods_online&op=store_class";
            break;
            
            //////////////////////结算模块//////////////////////////
        case SettleListApiCode:
            return @"storeapi/index.php?act=store_bill&op=billlist";
            break;
        case OwnersBillDetailsApiCode:
            return @"storeapi/index.php?act=store_bill&op=showbill";
            break;
        case OwnersBillConfirmApiCode:
            return @"storeapi/index.php?act=store_bill&op=confirm_bill";
            break;
        case ShopBillDetailsApiCode:
            return @"storeapi/index.php?act=store_bill&op=showpfbill";
            break;
        case TradeBillDetailsApiCode:
            return @"storeapi/index.php?act=store_bill&op=showsourcbill";
            break;
        case ShopOrTradeBillConfirmApiCode:
            return @"storeapi/index.php?act=store_bill&op=confirm_pf_bill";
            break;
            
            //////////////////////用户模块//////////////////////////
        case LoginApiCode:
            return @"storeapi/index.php?act=login&op=dologin";
            break;
        case AuthcodeApiCode:
            return @"storeapi/index.php?act=login&op=get_captcha";
            break;
        case PhoneNumVerifyApiCode:
            return @"storeapi/index.php?act=login&op=phone_validate";
            break;
        case RegisterApiCode:
            return @"storeapi/index.php?act=login&op=store_sms_register";
            break;
        case UploadRegisterPictureApiCode:
            return @"storeapi/index.php?act=login&op=uploadStoreFile";
            break;
        case UploadIconApiCode:
            return @"storeapi/index.php?act=upload&op=pic";
            break;
        case UploadDeliverPictureApiCode:
            return @"storeapi/index.php?act=store_deliver&op=uploadDeliverimg";
            break;
        case StoreCategoryApiCode:
            return @"storeapi/index.php?act=login&op=getOperaType";
            break;
        case ManagementCategoryApiCode:
            return @"storeapi/index.php?act=login&op=getOperaClass";
            break;
        case SubmitStoreInfoApiCode:
            return @"storeapi/index.php?act=store_info&op=set_store_info";
            break;
        case PullStoreInfoApiCode:
            return @"storeapi/index.php?act=store_info&op=store_info";
            break;
        case ResetPassWordApiCode:
            return @"storeapi/index.php?act=seccode&op=find_password";
            break;
        case GetAreaListApiCode:
            return @"storeapi/index.php?act=login&op=getArea";
            break;
        case VerifyRegisterUserNameApiCode:
            return @"storeapi/index.php?act=login&op=user_validate";
            break;
        case UpdateTokenApiCode:
            return @"storeapi/index.php?act=store_member&op=uptoken";
            break;
            
            //////////////////////数据收集模块//////////////////////////
        case CollectApiCode:
            return @"storeapi/index.php?act=app_user_log&op=addlog";
            break;
        case CollectDeviceInfoApiCode:
            return @"storeapi/index.php?act=app_device&op=addevice";
            break;
            
            /////////////////////Salesman模块////////////////////////
        case GetSalesmanInfoApiCode:
            return @"storeapi/index.php?act=t_order&op=getSellerInfo";
            break;
        case GetSalesmanAchievementApiCode:
            return @"storeapi/index.php?act=t_order&op=getSellerOrderInfo";
            break;
        case SubmitSalesmanSignStateApiCode:
            return @"storeapi/index.php?act=t_order&op=seller_sign";
            break;
            
        case GetSalesmanOrderListApiCode:
            return @"storeapi/index.php?act=t_order&op=order_list";
            break;
        case GetSalesmanPackInfoApiCode:
            return @"storeapi/index.php?act=t_order&op=get_pact_info";
            break;
            
        case GetSellerWalletApiCode:
            return @"storeapi/index.php?act=t_cash&op=getSellerWallet";
            break;
        case GetBankInfoApiCode:
            return @"storeapi/index.php?act=t_order&op=getBankInfo";
            break;
        case GetCashBankInfoApiCode:
            return @"storeapi/index.php?act=t_cash&op=getBankInfo";
            break;
        case GetBankCardNameApiCode:
            return @"storeapi/index.php?act=t_cash&op=getBankCardName";
            break;
        case bindingCardApiCode:
            return @"storeapi/index.php?act=t_cash&op=binding_card";
            break;
        case getBankListApiCode:
            return @"storeapi/index.php?act=t_cash&op=getBankList";
            break;
        case SalesmanCashAddApiCode:
            return @"storeapi/index.php?act=t_cash&op=salesman_cash_add";
            break;
            
        case CarReturnEditApiCode:
            
            break;
        case CashDetailListApiCode:
            return @"storeapi/index.php?act=t_cash&op=cashDetailList";
            break;
        case TaxListApiCode:
            return @"storeapi/index.php?act=t_cash&op=taxList";
            break;
        case TaxDetailApiCode:
            return @"storeapi/index.php?act=t_cash&op=taxDetail";
            break;

        default:
            return @"";
            break;
    }
    return @"";
}

//生成GET请求参数
+ (NSString*)getParameters:(NSDictionary*)parameters rootUrl:(NSString*)rootUrl{
    NSMutableString* resultStr = [NSMutableString stringWithString:rootUrl];
    
    if (parameters && parameters.count > 0) {
        NSArray* allKeys = [parameters allKeys];
        NSRange range = [rootUrl rangeOfString:@"?"];
        for (NSString* key in allKeys) {
            if (range.location == NSNotFound) {
                if ([key isEqualToString:[allKeys firstObject]]) {
                    [resultStr appendFormat:@"?%@=%@",key,[parameters objectForKey:key]];
                }else{
                    [resultStr appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
                }
            }else{
                [resultStr appendFormat:@"&%@=%@",key,[parameters objectForKey:key]];
            }
        }
    }
    
    return resultStr;
}

@end
