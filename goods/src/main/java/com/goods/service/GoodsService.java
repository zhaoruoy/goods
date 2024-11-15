package com.goods.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.goods.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author goods
 * @since 2023-06-03
 */
public interface GoodsService extends IService<Goods> {

    IPage pageCC(IPage<Goods> page, Wrapper wrapper);

    List<Goods> getGoods(String id);
}
