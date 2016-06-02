	UILabel *label2 =[[UILabel alloc] init];
        label2.font = font_10;
        label2.text=[NSString stringWithFormat:@"最大参考值:%@",[BBDVLineChartViewGlobalManager sharedInstance].result_rangeMax];
        label2.textColor = [UIColor redColor];

        CGFloat labelX=view2.frame.origin.x+view2.frame.size.width+3;
        CGFloat labelY=10;
        CGFloat labelW=140;
        CGFloat labelH=10;
       
        CGSize size=[label2 boundingRectWithSize:CGSizeMake(0, labelH)];
        labelW=size.width;
        label2.frame=CGRectMake(labelX, labelY, labelW, labelH);
        [buttonView addSubview:label2];
