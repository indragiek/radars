//
//  ViewController.m
//  SelfSizingCellScrollingBug
//
//  Created by Indragie on 1/23/15.
//  Copyright (c) 2015 Indragie Karunaratne. All rights reserved.
//

#import "ViewController.h"
#import "BasicCell.h"

@implementation ViewController {
    NSArray *_strings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(loadMore:)];
    
    _strings = @[
        @"Etiam Ornare Tristique Nibh Mollis",
        @"Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.",
        @"Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.",
        @"Curabitur blandit tempus porttitor. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        @"Maecenas faucibus mollis interdum. Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit sit amet non magna. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
        @"Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.",
        @"Nulla vitae elit libero, a pharetra augue. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
        @"Nulla vitae elit libero, a pharetra augue. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nulla vitae elit libero, a pharetra augue. Sed posuere consectetur est at lobortis. Nullam quis risus eget urna mollis ornare vel eu leo. Sed posuere consectetur est at lobortis.\nFusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Donec ullamcorper nulla non metus auctor fringilla. Sed posuere consectetur est at lobortis. Nulla vitae elit libero, a pharetra augue.",
        @"Nulla vitae elit libero, a pharetra augue. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.\nCurabitur blandit tempus porttitor. Maecenas sed diam eget risus varius blandit sit amet non magna. Nulla vitae elit libero, a pharetra augue. Sed posuere consectetur est at lobortis. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit non mi porta gravida at eget metus. Donec ullamcorper nulla non metus auctor fringilla. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Sed posuere consectetur est at lobortis. Curabitur blandit tempus porttitor. Donec id elit non mi porta gravida at eget metus."
    ];
}

- (void)loadMore:(UIBarButtonItem *)sender
{
    NSMutableArray *newStrings = [NSMutableArray arrayWithArray:_strings];
    [newStrings addObjectsFromArray:_strings];
    _strings = newStrings;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _strings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BasicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    cell.growingLabel.text = _strings[indexPath.row];
    return cell;
}

@end
