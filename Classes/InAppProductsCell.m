//
//  InAppProductsCell.m
//  linphone
//
//  Created by Gautier Pelloux-Prayer on 15/04/15.
//
//

#import "InAppProductsCell.h"

@implementation InAppProductsCell

- (void)setIsMaximized:(BOOL)isMaximized {
	_isMaximized = isMaximized;

	//show the BUY button only when not maximized

	self.frame = CGRectMake(self.frame.origin.x,
							self.frame.origin.y,
							self.frame.size.width,
							[InAppProductsCell getHeight:isMaximized]);
}

- (id)initWithIdentifier:(NSString*)identifier {
	if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) != nil) {
		NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"InAppProductsCell"
															  owner:self
															options:nil];
		if ([arrayOfViews count] >= 1) {
			[self.contentView addSubview:[arrayOfViews objectAtIndex:0]];
		}
	}
	return self;
}

- (void)dealloc {
	[_ptitle release];
	[_pdescription release];
	[_pprice release];
	[_ppurchased release];
    [super dealloc];
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@ (%@): %@", _ptitle.text, _pprice.text, _pdescription.text];
}

+ (CGFloat)getHeight:(BOOL)maximized {
	return maximized ? 120 : 44;
}

@end