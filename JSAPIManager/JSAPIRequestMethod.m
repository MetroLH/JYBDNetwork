//
//  JSAPIRequestMethod.m
//  JYBD-Supplier
//
//  Created by 刘海 on 2018/2/23.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSAPIRequestMethod.h"

@implementation JSAPIRequestMethod

+ (YTKRequestMethod)getRequestMethod:(JSApiManagerUrlCode)code{
    switch (code) {
        case ClientShoppingCarAddApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientShoppingCarDeleteApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientSubmitOrderApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientGetOrderInfoApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientSumbitOrderPriceApiCode:
            return YTKRequestMethodPOST;
            break;
        case AddClientInvoiceApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientInvoiceDeleteApiCode:
            return YTKRequestMethodPOST;
            break;
        case ClientOrderShareUrlApiCode:
            return YTKRequestMethodPOST;
            break;
        case FeedBackApiCode:
            return YTKRequestMethodPOST;
            break;
        case GoodsChukuApiCode:
            return YTKRequestMethodPOST;
            break;
        case CarReceiveApiCode:
            return YTKRequestMethodPOST;
            break;
        case StoreOrChainReceiveApiCode:
            return YTKRequestMethodPOST;
            break;
        case CommitCarRefundApplyApiCode:
            return YTKRequestMethodPOST;
            break;
        case CommitChainRefundApplyApiCode:
            return YTKRequestMethodPOST;
            break;
        case CommitCarReturnApplyApiCode:
            return YTKRequestMethodPOST;
            break;
        case CommitChainReturnApplyApiCode:
            return YTKRequestMethodPOST;
            break;
        case GoodsModifySpecApiCode:
            return YTKRequestMethodPOST;
            break;
        case GoodsBatchModifySpecApiCode:
            return YTKRequestMethodPOST;
            break;
        case GoodsAdvertEditApiCode:
            return YTKRequestMethodPOST;
            break;
        case LoginApiCode:
            return YTKRequestMethodPOST;
            break;
        case PhoneNumVerifyApiCode:
            return YTKRequestMethodPOST;
            break;
        case RegisterApiCode:
            return YTKRequestMethodPOST;
            break;
        case UploadRegisterPictureApiCode:
            return YTKRequestMethodPOST;
            break;
        case UploadIconApiCode:
            return YTKRequestMethodPOST;
            break;
        case UploadDeliverPictureApiCode:
            return YTKRequestMethodPOST;
            break;
        case SubmitStoreInfoApiCode:
            return YTKRequestMethodPOST;
            break;
        case ResetPassWordApiCode:
            return YTKRequestMethodPOST;
            break;
        case CollectApiCode:
            return YTKRequestMethodPOST;
            break;
        case GoodsDcdModifyApiCode:
            return YTKRequestMethodPOST;
            break;
        case CheckAppVersionApiCode:
            return YTKRequestMethodPOST;
            break;
        case EditClientShoppingCarNum:
            return YTKRequestMethodPOST;
            break;
        case DeleteAddressApiCode:
            return YTKRequestMethodPOST;
            break;
        case SetDefaultAddressApiCode:
            return YTKRequestMethodPOST;
            break;
        case SetSendGoodsApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetSalesmanListApiCode:
            return YTKRequestMethodPOST;
            break;
        case AddDeliverAddressApiCode:
            return YTKRequestMethodPOST;
            break;
        case EditDeliverAddressApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetSellerWalletApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetBankInfoApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetCashBankInfoApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetBankCardNameApiCode:
            return YTKRequestMethodPOST;
            break;
        case bindingCardApiCode:
            return YTKRequestMethodPOST;
            break;
        case SalesmanCashAddApiCode:
            return YTKRequestMethodPOST;
            break;
        case GetGoodsDcdTypeApiCode:
            return YTKRequestMethodPOST;
            break;
        case CollectDeviceInfoApiCode:
            return YTKRequestMethodPOST;
            break;
        case UpdateTokenApiCode:
            return YTKRequestMethodPOST;
            break;
        case SubmitSalesmanSignStateApiCode:
            return YTKRequestMethodPOST;
            break;
            
        default:
            return YTKRequestMethodGET;
            break;
    }
    return YTKRequestMethodGET;
}

@end
