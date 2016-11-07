//
//  NJRequsets.h
//  家装
//
//  Created by mac on 16/7/13.
//  Copyright © 2016年 mac. All rights reserved.
//

#ifndef NJRequsets_h
#define NJRequsets_h


#import <UIKit/UIKit.h>

#pragma mark- 商城接口

/**
 *  商品详情
 */
static NSString *APiShopdetail = @"http://afadsfasdfasdfasdfasdf";
static NSString *PhotoUrl = @"http://jiazhuang.siruoit.com/attachs/";
/**
 *  1、商家分类
 http://jiazhuang.siruoit.com/index.php?api/api-catelist
 [参数]
 
 [返回]
 cat_id:分类ID
 title:分类名称
 
 ----------------------------------------------------------------------------
 
 2、商家列表
 http://jiazhuang.siruoit.com/index.php?mall/store/store_list-3-0-1-上海
 
 [参数]
 3-0-1-上海
 参数1——cat_id:分类
 参数2——1:credit(DESC),2:score(ASC),0:正常检索
 参数3——分页
 参数4——城市
 
 [返回]
 shop_id:店铺ID
 logo:商家图标
 addr:地址
 name:商家名称
 phone:联系电话
 score:信誉指数
 group_name:店铺等级
 products:共有商品
 views:浏览量
 
 ----------------------------------------------------------------------------
 
 3、首页轮番广告
 http://jiazhuang.siruoit.com/index.php?mall/store/adv_list-上海
 [参数]
 参数1——城市
 
 [返回]
 thumb:图片
 title:标题
 
 4、用户登录
 http://jiazhuang.siruoit.com/index.php?api/api-login/type/uname/pwd
 [参数]
 type--0:邮箱，1:手机
 uname--邮箱地址/手机号
 pwd--登录密码
 
 [返回]
 uid:用户ID
 uname:用户名
 from:注册类型
 from_title:类型名称
 mail:邮箱地址
 mobile:手机号
 gold:金币
 gender:性别
 face:头像
 dateline:注册时间
 invitate:邀请码
 verify_mail:邮箱认证
 verify_mobile:手机认证
 type:商家注册类型 -1-无,0-普通商家,1-365商家,2-千元商家,3-万元商家
 lv:会员等级
 
 5、装修问答
 http://jiazhuang.siruoit.com/index.php?api/api-ask/uid/page
 [参数]
 uid--用户ID
 page--页数
 
 [返回]
 ask_id:问题ID
 title:标题
 dateline:提问时间
 views:查看次数
 uid:用户ID
 answer_num:回答次数
 audit:问题是否审核
 answer_id:回答ID
 
 
 6、装修日记
 http://jiazhuang.siruoit.com/index.php?api/api-diary/uid/page
 [参数]
 uid:用户ID
 page:页码
 
 [返回]
 diary_id:日记ID
 city:城市
 title:日记标题
 uid:用户ID
 home_name:小区
 thumb:缩略图
 type:空间户型
 way:装修方式
 start_date:开工日期
 end_date:完工日期
 audit:审核状态
 dateline:创建日期
 
 6-1、删除装修日记
 6、装修日记
 http://jiazhuang.siruoit.com/index.php?api/api-diarydelete/uid/diary_id
 [参数]
 uid:用户ID
 diary_id:日记ID
 
 [返回]
 result:0-失败,1-成功
 msg:提示信息
 
 7、商城订单
 http://jiazhuang.siruoit.com/index.php?api/api-order/uid/all/page
 [参数]
 uid:用户ID
 all:订单类型，all-全部订单,payed-已付款,unpay-未付款,finish-已完成,cancel-已取消,ship-已发货
 page:页码
 
 [返回]
 order_id:订单ID
 order_no:订单号
 uid:用户ID
 product_count:订单中商品总数量
 product_number:订单中商品种类
 product_amount:商品价格
 freight:运费
 amount:订单价格
 contact:联系人
 mobile:手机号
 addr:地址
 note:备注
 pay_status:支付状态 0-未付款，1-已付款
 pay_time:支付时间
 order_status:订单状态 -2-商家取消，-1-用户取消，0-未处理，1-已发货，2-已收货（已完成）
 audit:审核
 closed:订单关闭 0-未关闭,1-已关闭
 dateline:订单日期
 product_list:订单中商品列表
 product_id:商品ID
 title:商品标题
 order_id:订单ID
 name:商品名称
 danwei:单位
 market_price:市场价
 price:店铺价
 photo:图片
 city_name:城市
 area_name:区县
 cate_name:分类
 product_name:商品名称
 product_price:商品单价
 number:数量
 amount:金额
 
 8、订单操作
 http://jiazhuang.siruoit.com/index.php?api/api-orderupdate/uid/operate/order_no
 [参数]
 uid:用户ID
 operate:cancel-取消订单,ship-确认收货,refund-申请退款
 order_no:订单号
 
 [返回]
 result:0-失败,1-确认收货成功,2-取消订单成功,3-申请退款成功
 msg:提示信息
 
 8-1、设置订单状态为已支付
 http://jiazhuang.siruoit.com/index.php?api/api-orderpayed
 post拼接字符串{"order_no":"base64_encode(RSA加密字符串)"},字符串变量名为order
 
 [返回]
 result:0-失败,1-成功
 msg:提示信息
 
 
 9、我的预约
 http://jiazhuang.siruoit.com/index.php?api/api-company/uid/page
 [参数]
 company-公司,designer-设计师,mechanic-技工,shop-商家,gz-工长
 uid:用户ID
 page:页码
 
 [返回]
 yuyue_id:预约ID
 contact:我的联系方法
 mobile:我的手机号
 content:预约内容
 status_title:预约状态
 dateline:创建日期
 city_name:城市
 yuyue:预约对方信息
 id:ID
 title:标题
 logo:LOGO
 contact:联系人
 phone:电话
 mobile:手机
 addr:地址
 
 10、预约操作
 http://jiazhuang.siruoit.com/index.php?api/api-yuyue/type/yuyue_id/status
 [参数]
 type:company:公司,designer-设计师,mechanic-技工,shop-商家,gz-工长
 yuyue_id:预约ID
 status:0-未处理,1-意向,2-已签,-1-无效
 
 [返回]
 result:0-失败,1-成功
 msg:提示信息
 
 11、我的装修保
 http://jiazhuang.siruoit.com/index.php?api/api-zxb/uid/page
 [参数]
 uid:用户ID
 page:页码
 
 [返回]
 zxb_id:装修保ID
 tenders_id:招标ID
 uid:用户ID
 contact:业主姓名
 mobile:业主电话
 comment:业主备注
 status:状态
 remark:公司备注
 audit:审核
 dateline:创建日期
 
 12、修改密码
 http://jiazhuang.siruoit.com/index.php?api/api-passwd/uid/oldpasswd/newpasswd
 [参数]
 uid:用户ID
 oldpasswd:旧密码(明文)
 newpasswd:新密码(明文)
 
 [返回]
 result:0-失败,1-成功
 msg:提示信息
 注:请在客户端做两次输入密码的比较;
 
 13、商品分类
 http://jiazhuang.siruoit.com/index.php?api/api-catelist/cat_id
 [参数]
 
 [返回]
 cat_id:分类ID
 title:分类名称
 
 14、商品列表
 http://jiazhuang.siruoit.com/index.php?api/api-product/cat_id-page
 http://jiazhuang.siruoit.com/index.php?api/api-product/1(该请求返回优惠商品)
 [参数]
 cat_id:分类ID
 page:页码
 
 [返回]
 product_id:商品ID
 photo:图片
 title:标题
 name:名称
 danwei:单位
 market_price:市场价
 price:商铺价
 member_price:会员价
 shop_price:商家价
 city:城市
 area:区县
 cate:分类名称
 
 15、商品详情
 http://jiazhuang.siruoit.com/index.php?api/api-detail/product_id
 [参数]
 product_id:商品ID
 
 [返回]
 product_id:商品ID
 title:标题
 name:名称
 danwei:单位
 market_price:市场价
 price:商铺价
 photo:图片
 member_price:会员价
 shop_price:商家价
 city:城市
 area:区县
 cate:分类名称
 shop:店铺信息
 shop_id:店铺ID
 addr:店铺地址
 info:店铺信息
 title:店铺标题
 name:店铺名称
 logo:店铺LOGO
 contact:联系人
 phone:电话
 mobile:手机
 photo_list:商品图片列表
 photo_id:图片ID
 photo:图片
 spec_list:商品型号列表
 spec_id:型号ID
 price:价格
 spec_photo:型号对应图片
 spec_name:型号名称
 
 16、提交商城订单
 http://jiazhuang.siruoit.com/index.php?api/api-createorder
 拼接以下JSON字符串，字符串变量名为order，提交的订单为未付款状态，商品价格根据用户登录情况提交会员价格或者商家价格，会根据会员等级自动折扣。
 {"items":[
 {"product_id":"商品ID1","name":"商品名称","shop_id":"店铺ID1","city_id":"城市ID","freight":"运费","cart_key":"商品ID1-型号ID","num":"数量","spec_id":"型号ID","product_price":"商品价格-会员价格或商家价格"},
 {"product_id":"商品ID2","name":"商品名称","shop_id":"店铺ID2","city_id":"城市ID","freight":"运费","cart_key":"商品ID2-型号ID","num":"数量","spec_id":"型号ID","product_price":"商品价格-会员价格或商家价格"}],
 "shop_ids":["店铺ID1","店铺ID2"],
 "product_ids":["商品ID1","商品ID2"],"uid":"用户ID","addr":"邮寄地址","contact":"联系人","mobile":"手机号","note":"备注"}
 
 [返回]
 result:0-失败,1-成功
 msg:提示信息
 
 17、团装优惠
 http://jiazhuang.siruoit.com/index.php?api/api-tuan
 [参数]
 
 [返回]
 items:参团列表
 -----------------------------------
 tuan_id:参团ID
 city_id:城市ID
 area_id:区ID
 title:装修公司名称
 home_id:小区ID
 compan_id:公司ID
 sign_num:报名户数
 qy_num:签约户数
 sg_num:已施工户数
 stime:开始时间
 ltime:结束时间
 content:内容
 audit:是否审核
 jieyue:节约
 
 home_list:小区列表
 ------------------------------------
 home_id:小区ID
 city_id:城市ID
 area_id:区ID
 title:小区标题
 name:小区名称
 thumb:小区缩略图
 phone:手机
 kfs:开发商
 qq_qun:QQ群
 price:单价
 kp_date:开盘时间
 jf_date:交房时间
 lng:纬度
 lat:经度
 views:查看次数
 addr:地址
 content:描述
 
 18、优惠活动
 http://jiazhuang.siruoit.com/index.php?api/api-activity/cat_id/page
 [参数]
 cat_id:分类ID
 page:页码
 
 [返回]
 cat_list:活动分类
 ---------------------------------
 cat_id:分类ID
 title:分类标题
 
 activity:活动列表
 ---------------------------------
 activity_id:活动ID
 city_id:城市ID
 cat_id:分类ID
 thumb:缩略图
 banner:BANNER
 phone:电话
 qq:QQ
 bg_time:开始时间
 end_time:结束时间
 sign_num:报名人数
 views:查看次数
 lng:纬度
 lat:经度
 info:信息
 audit:是否审核
 city_name:城市名称
 status_title:状态
 intro:活动介绍
 title:活动标题
 addr:活动地址
 
 19、找装修公司
 http://jiazhuang.siruoit.com/index.php?api/api-gs-区-等级-服务-规模-order-page
 示例http://jiazhuang.siruoit.com/index.php?api/api-gs-0-0-0-0-0-1
 [参数]
 见URL
 
 [返回]
 attr_list:属性列表
 -------------------------------
 attr_id:属性ID
 title:属性标题
 from_id:
 multi:
 filter:
 values:属性分类值
 -----------------------------
 attr_values_id:属性分类ID
 attr_id:属性ID
 title:属性分类标题
 
 area_list:区列表
 -------------------------------
 area_id:区ID
 area_name:区名称
 city_id:城市ID
 city_name:城市名称
 
 group_list:等级列表
 -------------------------------
 group_id:等级ID
 group_name:等级名称
 
 items:装修公司
 -------------------------------
 company_id:公司ID
 uid:内部ID
 group_id:等级ID
 city_id:城市ID
 area_id:区ID
 thumb:缩略图
 logo:LOGO
 phone:电话
 mobile:手机
 qq:QQ
 xiaobao:消保金
 lng:纬度
 lat:经度
 comments:业主评价数
 score:综合评分
 score1:服务
 score2:价格
 score3:设计
 tenders_num:签单数
 tender_sign:
 case_num:案例
 site_num:在建工地
 news_num:企业新闻
 youhui_num:
 yuyue_num:预约数
 views:访客数
 is_vip:是否会员
 audit:是否审核
 avg_score:综合评分
 group_name:等级名称
 city_name:城市名称
 area_name:区名称
 addr:地址
 contact:联系人
 slogan:口号
 name:名称
 title:标题
 
 */



#endif /* NJRequsets_h */
