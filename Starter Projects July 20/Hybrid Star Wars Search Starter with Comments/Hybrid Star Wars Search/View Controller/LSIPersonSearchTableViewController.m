//
//  LSIPersonSearchTableViewController.m
//  Hybrid Star Wars Search
//
//  Created by Spencer Curtis on 1/28/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

#import "LSIPersonSearchTableViewController.h"
#import "LSIPerson.h"
#import "Hybrid_Star_Wars_Search-Swift.h"

@interface LSIPersonSearchTableViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic) NSArray<LSIPerson *> *people;

@end

@implementation LSIPersonSearchTableViewController

// this init is called when storyboard is loaded
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.people = @[];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSIPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    LSIPerson *person = self.people[indexPath.row];
    cell.person = person;
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // Call the PersonController's search method
    [[PersonController sharedController] searchForPeopleWithSearchTerm: searchBar.text
                                                       completionBlock:^(NSArray<LSIPerson *> * _Nullable people, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error searching for %@ %@,", searchBar.text, error);
        }
        
        self.people = people;
    }];
}


// Use the equivalent of a didSet to reload the table view on the correct queue.
- (void)setPeople:(NSArray<LSIPerson *> *)people {
    
    _people = [people copy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
