SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(15) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_objid` varchar(50) NOT NULL,
  `owner_address_text` varchar(255) NULL,
  `owner_address_objid` varchar(50) NULL,
  `businessname` varchar(255) NULL,
  `tradename` varchar(255) NOT NULL,
  `address_text` varchar(255) NULL,
  `address_objid` varchar(50) NULL,
  `orgtype` varchar(50) NULL,
  `yearstarted` int(11) NULL,
  `activeyear` int(11) NULL,
  `pin` varchar(50) NULL,
  `taxcredit` decimal(18,2) NULL,
  `currentapplicationid` varchar(50) NULL,
  `currentpermitid` varchar(50) NULL,
  `bin` varchar(50) NULL,
  `activeqtr` int(11) NULL,
  `appcount` int(11) NULL,
  `mobileno` varchar(50) NULL,
  `phoneno` varchar(50) NULL,
  `email` varchar(50) NULL,
  `apptype` varchar(50) NULL,
  `oldbin` varchar(50) NULL,
  `permit_objid` varchar(50) NULL,
  `permittype` varchar(50) NULL,
  `expirydate` date NULL,
  `officetype` varchar(25) NULL,
  `purpose` varchar(50) NULL,
  `nextrenewaldate` date NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessname` (`businessname`),
  UNIQUE KEY `uix_bin` (`bin`),
  KEY `ix_state` (`state`),
  KEY `ix_owner_objid` (`owner_objid`),
  KEY `ix_owner_name` (`owner_name`),
  KEY `ix_owner_address_objid` (`owner_address_objid`),
  KEY `ix_tradename` (`tradename`),
  KEY `ix_address_objid` (`address_objid`),
  KEY `ix_bin` (`bin`),
  KEY `ix_currentapplicationid` (`currentapplicationid`),
  KEY `ix_currentpermitid` (`currentpermitid`),
  KEY `ix_yearstarted` (`yearstarted`),
  KEY `ix_activeyear` (`activeyear`),
  CONSTRAINT `FK_business_business_address` FOREIGN KEY (`address_objid`) REFERENCES `business_address` (`objid`),
  CONSTRAINT `FK_business_business_application` FOREIGN KEY (`currentapplicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------

-- ----------------------------
-- Table structure for business_active_info
-- ----------------------------
DROP TABLE IF EXISTS `business_active_info`;
CREATE TABLE `business_active_info` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NOT NULL,
  `type` varchar(50) NULL,
  `attribute_objid` varchar(50) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `lob_objid` varchar(50) NULL,
  `lob_name` varchar(100) NULL,
  `decimalvalue` decimal(16,2) NULL,
  `intvalue` int(11) NULL,
  `stringvalue` varchar(255) NULL,
  `boolvalue` int(11) NULL,
  `phase` int(11) NULL,
  `level` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_attribute_objid` (`attribute_objid`),
  KEY `ix_attribute_name` (`attribute_name`),
  KEY `ix_lob_objid` (`lob_objid`),
  KEY `ix_lob_name` (`lob_name`),
  CONSTRAINT `FK_business_active_info_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_active_info_lob` FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_active_info
-- ----------------------------

-- ----------------------------
-- Table structure for business_active_lob
-- ----------------------------
DROP TABLE IF EXISTS `business_active_lob`;
CREATE TABLE `business_active_lob` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `FK_business_active_lob_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_active_lob_lob` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_active_lob
-- ----------------------------

-- ----------------------------
-- Table structure for business_active_lob_history
-- ----------------------------
DROP TABLE IF EXISTS `business_active_lob_history`;
CREATE TABLE `business_active_lob_history` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `activeyear` int(11) NULL,
  `lobid` varchar(50) NULL,
  `name` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `fk_business_active_lob_history_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_active_lob_history_lobid` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_active_lob_history
-- ----------------------------

-- ----------------------------
-- Table structure for business_active_lob_history_forprocess
-- ----------------------------
DROP TABLE IF EXISTS `business_active_lob_history_forprocess`;
CREATE TABLE `business_active_lob_history_forprocess` (
  `businessid` varchar(50) NOT NULL,
  PRIMARY KEY (`businessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_active_lob_history_forprocess
-- ----------------------------

-- ----------------------------
-- Table structure for business_address
-- ----------------------------
DROP TABLE IF EXISTS `business_address`;
CREATE TABLE `business_address` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NULL,
  `type` varchar(50) NULL,
  `addresstype` varchar(50) NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(100) NULL,
  `city` varchar(50) NULL,
  `province` varchar(50) NULL,
  `municipality` varchar(50) NULL,
  `bldgno` varchar(50) NULL,
  `bldgname` varchar(50) NULL,
  `unitno` varchar(50) NULL,
  `street` varchar(100) NULL,
  `subdivision` varchar(100) NULL,
  `pin` varchar(50) NULL,
  `monthlyrent` decimal(18,2) NULL,
  `lessor_objid` varchar(50) NULL,
  `lessor_name` varchar(255) NULL,
  `lessor_address_text` varchar(255) NULL,
  `rentedaddressid` varchar(50) NULL,
  `ownedaddressid` varchar(50) NULL,
  `lessor_address_objid` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_barangay_objid` (`barangay_objid`),
  KEY `ix_lessor_objid` (`lessor_objid`),
  KEY `ix_rentedaddressid` (`rentedaddressid`),
  KEY `ix_ownedaddressid` (`ownedaddressid`),
  KEY `ix_lessor_address_objid` (`lessor_address_objid`),
  CONSTRAINT `FK_business_address_ownerid` FOREIGN KEY (`ownedaddressid`) REFERENCES `business_lessor` (`objid`),
  CONSTRAINT `FK_business_address_rentedaddressid` FOREIGN KEY (`rentedaddressid`) REFERENCES `business_lessor` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_address
-- ----------------------------

-- ----------------------------
-- Table structure for business_application
-- ----------------------------
DROP TABLE IF EXISTS `business_application`;
CREATE TABLE `business_application` (
  `objid` varchar(50) NOT NULL,
  `business_objid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `appno` varchar(50) NULL,
  `apptype` varchar(25) NULL,
  `dtfiled` date NULL,
  `ownername` varchar(255) NULL,
  `owneraddress` varchar(255) NULL,
  `tradename` varchar(255) NULL,
  `businessaddress` varchar(255) NULL,
  `txndate` datetime NULL,
  `yearstarted` int(11) NULL,
  `appyear` int(11) NULL,
  `appqtr` int(11) NULL,
  `txnmode` varchar(25) NULL,
  `assessor_objid` varchar(50) NULL,
  `assessor_name` varchar(255) NULL,
  `assessor_title` varchar(50) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `approver_objid` varchar(50) NULL,
  `approver_name` varchar(255) NULL,
  `approver_title` varchar(50) NULL,
  `dtreleased` datetime NULL,
  `totals_tax` decimal(18,2) NULL,
  `totals_regfee` decimal(18,2) NULL,
  `totals_othercharge` decimal(18,2) NULL,
  `totals_total` decimal(18,2) NULL,
  `remarks` varchar(255) NULL,
  `permit_objid` varchar(50) NULL,
  `parentapplicationid` varchar(50) NULL,
  `nextbilldate` date NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_appno` (`appno`),
  KEY `ix_business_objid` (`business_objid`),
  KEY `ix_state` (`state`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_ownername` (`ownername`),
  KEY `ix_owneraddress` (`owneraddress`),
  KEY `ix_tradename` (`tradename`),
  KEY `ix_txndate` (`txndate`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_businessaddress` (`businessaddress`),
  KEY `ix_assessor_objid` (`assessor_objid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_approver_objid` (`approver_objid`),
  KEY `ix_dtreleased` (`dtreleased`),
  KEY `ix_permit_objid` (`permit_objid`),
  KEY `ix_parentapplicationid` (`parentapplicationid`),
  KEY `ix_nextbilldate` (`nextbilldate`),
  CONSTRAINT `FK_business_application_business` FOREIGN KEY (`business_objid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_application_parent` FOREIGN KEY (`parentapplicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application
-- ----------------------------

-- ----------------------------
-- Table structure for business_application_info
-- ----------------------------
DROP TABLE IF EXISTS `business_application_info`;
CREATE TABLE `business_application_info` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NULL,
  `activeyear` int(11) NULL,
  `type` varchar(50) NULL,
  `attribute_objid` varchar(50) NOT NULL,
  `attribute_name` varchar(50) NOT NULL,
  `lob_objid` varchar(50) NULL,
  `lob_name` varchar(100) NULL,
  `decimalvalue` decimal(16,2) NULL,
  `intvalue` int(11) NULL,
  `stringvalue` varchar(255) NULL,
  `boolvalue` int(11) NULL,
  `phase` int(11) NULL,
  `level` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_attribute_objid` (`attribute_objid`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `FK_business_info_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_business_info_business_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `FK_business_info_business_lob` FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application_info
-- ----------------------------

-- ----------------------------
-- Table structure for business_application_lob
-- ----------------------------
DROP TABLE IF EXISTS `business_application_lob`;
CREATE TABLE `business_application_lob` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NULL,
  `activeyear` int(11) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `assessmenttype` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_lobid` (`lobid`),
  KEY `ix_name` (`name`),
  CONSTRAINT `fk_business_application_lob_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_application_lob_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_application_lob_lob` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application_lob
-- ----------------------------

-- ----------------------------
-- Table structure for business_application_task
-- ----------------------------
DROP TABLE IF EXISTS `business_application_task`;
CREATE TABLE `business_application_task` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) NULL,
  `parentprocessid` varchar(50) NULL,
  `state` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `message` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_parentprocessid` (`parentprocessid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  CONSTRAINT `fk_business_application_task_application` FOREIGN KEY (`refid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application_task
-- ----------------------------

-- ----------------------------
-- Table structure for business_application_task_lock
-- ----------------------------
DROP TABLE IF EXISTS `business_application_task_lock`;
CREATE TABLE `business_application_task_lock` (
  `refid` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`refid`,`state`),
  KEY `ix_refid` (`refid`),
  CONSTRAINT `fk_business_application_task_lock_refid` FOREIGN KEY (`refid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application_task_lock
-- ----------------------------

-- ----------------------------
-- Table structure for business_application_workitem
-- ----------------------------
DROP TABLE IF EXISTS `business_application_workitem`;
CREATE TABLE `business_application_workitem` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `refid` varchar(50) NULL,
  `taskid` varchar(50) NULL,
  `workitemid` varchar(50) NULL,
  `startdate` datetime NULL,
  `enddate` datetime NULL,
  `assignee_objid` varchar(50) NULL,
  `assignee_name` varchar(100) NULL,
  `actor_objid` varchar(50) NULL,
  `actor_name` varchar(100) NULL,
  `remarks` varchar(255) NULL,
  `message` varchar(255) NULL,
  `action` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_taskid` (`taskid`),
  KEY `ix_workitemid` (`workitemid`),
  KEY `ix_startdate` (`startdate`),
  KEY `ix_enddate` (`enddate`),
  KEY `ix_assignee_objid` (`assignee_objid`),
  KEY `ix_actor_objid` (`actor_objid`),
  CONSTRAINT `fk_business_application_workitem_task` FOREIGN KEY (`taskid`) REFERENCES `business_application_task` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_application_workitem
-- ----------------------------

-- ----------------------------
-- Table structure for business_billing
-- ----------------------------
DROP TABLE IF EXISTS `business_billing`;
CREATE TABLE `business_billing` (
  `objid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NULL,
  `businessid` varchar(50) NULL,
  `billdate` datetime NULL,
  `apptype` varchar(50) NULL,
  `appyear` int(11) NULL,
  `expirydate` datetime NULL,
  `amount` decimal(18,2) NULL,
  `surcharge` decimal(18,2) NULL,
  `interest` decimal(18,2) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `ix_applicationid` (`applicationid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_billdate` (`billdate`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_expirydate` (`expirydate`),
  CONSTRAINT `FK_business_billing_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `FK_business_billing_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_billing
-- ----------------------------

-- ----------------------------
-- Table structure for business_billing_item
-- ----------------------------
DROP TABLE IF EXISTS `business_billing_item`;
CREATE TABLE `business_billing_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `receivableid` varchar(50) NULL,
  `account_objid` varchar(50) NULL,
  `account_title` varchar(255) NULL,
  `qtr` int(11) NULL,
  `duedate` datetime NULL,
  `amount` decimal(18,2) NULL,
  `surcharge` decimal(18,2) NULL,
  `interest` decimal(18,2) NULL,
  `discount` decimal(18,2) NULL,
  `lob_objid` varchar(50) NULL,
  `lob_assessmenttype` varchar(50) NULL,
  `taxfeetype` varchar(50) NULL,
  `paypriority` int(11) NULL,
  `sortorder` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receivableid` (`receivableid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_duedate` (`duedate`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `fk_business_billing_item_parent` FOREIGN KEY (`parentid`) REFERENCES `business_billing` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_billing_item
-- ----------------------------

-- ----------------------------
-- Table structure for business_billitem_txntype
-- ----------------------------
DROP TABLE IF EXISTS `business_billitem_txntype`;
CREATE TABLE `business_billitem_txntype` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NULL,
  `category` varchar(50) NULL,
  `acctid` varchar(50) NULL,
  `feetype` varchar(50) NULL,
  `domain` varchar(100) NULL,
  `role` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_billitem_txntype
-- ----------------------------

-- ----------------------------
-- Table structure for business_change_log
-- ----------------------------
DROP TABLE IF EXISTS `business_change_log`;
CREATE TABLE `business_change_log` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `applicationid` varchar(50) NOT NULL,
  `entryno` varchar(50) NOT NULL,
  `dtfiled` datetime NOT NULL,
  `filedby_objid` varchar(50) NOT NULL,
  `filedby_name` varchar(100) NOT NULL,
  `changetype` varchar(50) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `particulars` text,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_entryno` (`entryno`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  CONSTRAINT `FK_business_change_log_applicationid` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `FK_business_change_log_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_change_log
-- ----------------------------

-- ----------------------------
-- Table structure for business_closure
-- ----------------------------
DROP TABLE IF EXISTS `business_closure`;
CREATE TABLE `business_closure` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(150) NOT NULL,
  `dtceased` date NOT NULL,
  `dtissued` datetime NOT NULL,
  `remarks` text,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessid` (`businessid`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_dtceased` (`dtceased`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_dtissued` (`dtissued`),
  CONSTRAINT `fk_business_closure_businessid` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_closure
-- ----------------------------

-- ----------------------------
-- Table structure for business_compromise
-- ----------------------------
DROP TABLE IF EXISTS `business_compromise`;
CREATE TABLE `business_compromise` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `txntype` varchar(50) NULL,
  `dtfiled` datetime NULL,
  `dtexpiry` datetime NULL,
  `description` varchar(255) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `approver_objid` varchar(50) NULL,
  `approver_name` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_txntype` (`txntype`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_dtexpiry` (`dtexpiry`),
  KEY `ix_createdby_objid` (`createdby_objid`),
  KEY `ix_approver_objid` (`approver_objid`),
  CONSTRAINT `fk_business_compromise_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_compromise
-- ----------------------------

-- ----------------------------
-- Table structure for business_lessor
-- ----------------------------
DROP TABLE IF EXISTS `business_lessor`;
CREATE TABLE `business_lessor` (
  `objid` varchar(50) NOT NULL,
  `government` int(11) NULL,
  `lessor_orgtype` varchar(50) NULL,
  `lessor_objid` varchar(50) NULL,
  `lessor_name` varchar(100) NULL,
  `lessor_address_text` varchar(255) NULL,
  `lessor_address_objid` varchar(50) NULL,
  `bldgno` varchar(50) NULL,
  `bldgname` varchar(50) NULL,
  `street` varchar(100) NULL,
  `subdivision` varchar(100) NULL,
  `barangay_objid` varchar(50) NULL,
  `barangay_name` varchar(100) NULL,
  `pin` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_lessor_objid` (`lessor_objid`),
  KEY `ix_lessor_address_objid` (`lessor_address_objid`),
  KEY `ix_bldgno` (`bldgno`),
  KEY `ix_bldgname` (`bldgname`),
  KEY `ix_barangay_objid` (`barangay_objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_lessor
-- ----------------------------

-- ----------------------------
-- Table structure for business_payment
-- ----------------------------
DROP TABLE IF EXISTS `business_payment`;
CREATE TABLE `business_payment` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `appyear` int(11) NULL,
  `applicationid` varchar(50) NULL,
  `refid` varchar(50) NULL,
  `reftype` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `refdate` date NULL,
  `amount` decimal(18,2) NULL,
  `remarks` varchar(255) NULL,
  `voided` int(11) NULL,
  `paymentmode` varchar(50) NULL,
  `taxcredit` decimal(16,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_refdate` (`refdate`),
  CONSTRAINT `fk_business_payment_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_payment_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_payment
-- ----------------------------

-- ----------------------------
-- Table structure for business_payment_item
-- ----------------------------
DROP TABLE IF EXISTS `business_payment_item`;
CREATE TABLE `business_payment_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `receivableid` varchar(50) NULL,
  `amount` decimal(16,2) NULL,
  `discount` decimal(16,2) NULL,
  `account_objid` varchar(50) NULL,
  `account_code` varchar(50) NULL,
  `account_title` varchar(100) NULL,
  `lob_objid` varchar(50) NULL,
  `lob_name` varchar(255) NULL,
  `remarks` varchar(255) NULL,
  `txntype` varchar(50) NULL,
  `sortorder` int(11) NULL,
  `surcharge` decimal(16,2) NULL,
  `interest` decimal(16,2) NULL,
  `qtr` int(11) NULL,
  `partial` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_receivableid` (`receivableid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `fk_business_payment_item_parent` FOREIGN KEY (`parentid`) REFERENCES `business_payment` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_payment_item
-- ----------------------------

-- ----------------------------
-- Table structure for business_permit
-- ----------------------------
DROP TABLE IF EXISTS `business_permit`;
CREATE TABLE `business_permit` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `applicationid` varchar(50) NULL,
  `state` varchar(20) NULL,
  `permitno` varchar(20) NULL,
  `activeyear` int(11) NULL,
  `version` int(11) NULL,
  `permittype` varchar(20) NULL,
  `dtissued` date NULL,
  `issuedby_objid` varchar(50) NULL,
  `issuedby_name` varchar(255) NULL,
  `expirydate` date NULL,
  `remarks` varchar(255) NULL,
  `plateno` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessid_activeyear_version` (`businessid`,`activeyear`,`version`),
  UNIQUE KEY `uix_permitno` (`permitno`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_activeyear` (`activeyear`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_issuedby_objid` (`issuedby_objid`),
  KEY `ix_expirydate` (`expirydate`),
  KEY `ix_plateno` (`plateno`),
  CONSTRAINT `fk_business_permit_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_permit_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_permit
-- ----------------------------

-- ----------------------------
-- Table structure for business_permit_lob
-- ----------------------------
DROP TABLE IF EXISTS `business_permit_lob`;
CREATE TABLE `business_permit_lob` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `lobid` varchar(50) NULL,
  `name` varchar(255) NOT NULL,
  `txndate` datetime NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_lobid` (`lobid`),
  KEY `ix_name` (`name`),
  CONSTRAINT `fk_business_permit_lob_lobid` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `fk_business_permit_lob_parentid` FOREIGN KEY (`parentid`) REFERENCES `business_permit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_permit_lob
-- ----------------------------

-- ----------------------------
-- Table structure for business_permit_type
-- ----------------------------
DROP TABLE IF EXISTS `business_permit_type`;
CREATE TABLE `business_permit_type` (
  `objid` varchar(10) NOT NULL,
  `title` varchar(100) NULL,
  `options` varchar(255) NULL,
  `indexno` int(11) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_permit_type
-- ----------------------------

-- ----------------------------
-- Table structure for business_receivable
-- ----------------------------
DROP TABLE IF EXISTS `business_receivable`;
CREATE TABLE `business_receivable` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `applicationid` varchar(50) NULL,
  `iyear` int(11) NULL,
  `account_objid` varchar(50) NULL,
  `account_title` varchar(100) NULL,
  `lob_objid` varchar(50) NULL,
  `lob_name` varchar(100) NULL,
  `amount` decimal(16,2) NOT NULL,
  `amtpaid` decimal(16,2) NOT NULL,
  `discount` decimal(16,2) NOT NULL,
  `taxcredit` decimal(16,2) NULL,
  `refid` varchar(50) NULL,
  `reftype` varchar(50) NULL,
  `remarks` varchar(255) NULL,
  `department` varchar(50) NULL,
  `taxfeetype` varchar(50) NULL,
  `qtr` int(11) NULL,
  `surcharge` decimal(16,2) NULL,
  `interest` decimal(16,2) NULL,
  `assessmenttype` varchar(50) NULL,
  `lastqtrpaid` int(11) NULL,
  `partial` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_account_objid` (`account_objid`),
  KEY `ix_lob_objid` (`lob_objid`),
  CONSTRAINT `fk_business_receivable_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_receivable_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_business_receivable_lob_objid` FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_receivable
-- ----------------------------

-- ----------------------------
-- Table structure for business_receivable_detail
-- ----------------------------
DROP TABLE IF EXISTS `business_receivable_detail`;
CREATE TABLE `business_receivable_detail` (
  `objid` varchar(50) NOT NULL,
  `receivableid` varchar(50) NULL,
  `qtr` int(11) NULL,
  `duedate` datetime NULL,
  `amount` decimal(18,2) NULL,
  `surcharge` decimal(18,2) NULL,
  `interest` decimal(18,2) NULL,
  `discount` decimal(18,2) NULL,
  `paypriority` int(11) NULL,
  `sortorder` int(11) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_receivableid` (`receivableid`),
  KEY `ix_duedate` (`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_receivable_detail
-- ----------------------------

-- ----------------------------
-- Table structure for business_recurringfee
-- ----------------------------
DROP TABLE IF EXISTS `business_recurringfee`;
CREATE TABLE `business_recurringfee` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NULL,
  `state` varchar(20) NULL,
  `account_objid` varchar(50) NULL,
  `account_title` varchar(100) NULL,
  `amount` decimal(16,2) NOT NULL,
  `remarks` varchar(255) NULL,
  `department` varchar(50) NULL,
  `user_objid` varchar(50) NULL,
  `user_name` varchar(150) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_businessid_acctid` (`businessid`,`account_objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_account_objid` (`account_objid`),
  CONSTRAINT `fk_business_recurringfee_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_recurringfee
-- ----------------------------

-- ----------------------------
-- Table structure for business_redflag
-- ----------------------------
DROP TABLE IF EXISTS `business_redflag`;
CREATE TABLE `business_redflag` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `message` varchar(255) NULL,
  `dtfiled` datetime NULL,
  `filedby_objid` varchar(50) NULL,
  `filedby_name` varchar(255) NULL,
  `resolved` int(11) NULL,
  `remarks` varchar(255) NULL,
  `blockaction` varchar(50) NULL,
  `effectivedate` date NULL,
  `resolvedby_objid` varchar(50) NULL,
  `resolvedby_name` varchar(100) NULL,
  `caseno` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_dtfiled` (`dtfiled`),
  KEY `ix_filedby_objid` (`filedby_objid`),
  KEY `ix_effectivedate` (`effectivedate`),
  KEY `ix_resolvedby_objid` (`resolvedby_objid`),
  CONSTRAINT `fk_business_redflag_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_redflag
-- ----------------------------

-- ----------------------------
-- Table structure for business_requirement
-- ----------------------------
DROP TABLE IF EXISTS `business_requirement`;
CREATE TABLE `business_requirement` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `applicationid` varchar(50) NULL,
  `refid` varchar(50) NULL,
  `reftype` varchar(50) NULL,
  `refno` varchar(50) NULL,
  `issuedby` varchar(100) NULL,
  `dtissued` date NULL,
  `placeissued` varchar(100) NULL,
  `title` varchar(50) NULL,
  `remarks` varchar(255) NULL,
  `status` varchar(25) NULL,
  `step` varchar(50) NULL,
  `completedby_objid` varchar(50) NULL,
  `completedby_name` varchar(50) NULL,
  `dtcompleted` datetime NULL,
  `completed` int(11) NULL,
  `expirydate` date NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_businessid` (`businessid`),
  KEY `ix_applicationid` (`applicationid`),
  KEY `ix_refid` (`refid`),
  KEY `ix_refno` (`refno`),
  KEY `ix_dtissued` (`dtissued`),
  KEY `ix_completedby_objid` (`completedby_objid`),
  KEY `ix_dtcompleted` (`dtcompleted`),
  CONSTRAINT `fk_business_requirement_application` FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`),
  CONSTRAINT `fk_business_requirement_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_requirement
-- ----------------------------

-- ----------------------------
-- Table structure for business_sms
-- ----------------------------
DROP TABLE IF EXISTS `business_sms`;
CREATE TABLE `business_sms` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `traceid` varchar(50) NULL,
  `phoneno` varchar(50) NULL,
  `logdate` datetime NULL,
  `message` varchar(255) NULL,
  `amount` decimal(10,2) NULL,
  `amtpaid` decimal(10,2) NULL,
  `action` varchar(50) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_sms
-- ----------------------------

-- ----------------------------
-- Table structure for business_taxcredit
-- ----------------------------
DROP TABLE IF EXISTS `business_taxcredit`;
CREATE TABLE `business_taxcredit` (
  `objid` varchar(50) NOT NULL DEFAULT '',
  `businessid` varchar(50) NULL,
  `currentlineno` int(11) NULL,
  `totaldr` decimal(18,2) NULL,
  `totalcr` decimal(18,2) NULL,
  `balance` decimal(18,2) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_taxcredit
-- ----------------------------

-- ----------------------------
-- Table structure for business_taxcredit_item
-- ----------------------------
DROP TABLE IF EXISTS `business_taxcredit_item`;
CREATE TABLE `business_taxcredit_item` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `lineno` int(11) NULL,
  `particulars` varchar(100) NULL,
  `refid` varchar(50) NULL,
  `refdate` date NULL,
  `refno` varchar(50) NULL,
  `reftype` varchar(20) NULL,
  `dr` decimal(18,2) NULL,
  `cr` decimal(18,2) NULL,
  PRIMARY KEY (`objid`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `FK_business_taxcredit_detail_business_taxcredit` FOREIGN KEY (`parentid`) REFERENCES `business_taxcredit` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_taxcredit_item
-- ----------------------------

-- ----------------------------
-- Table structure for business_taxincentive
-- ----------------------------
DROP TABLE IF EXISTS `business_taxincentive`;
CREATE TABLE `business_taxincentive` (
  `objid` varchar(50) NOT NULL,
  `businessid` varchar(50) NULL,
  `txntype` varchar(50) NULL,
  `dtfiled` datetime NULL,
  `dtexpiry` datetime NULL,
  `title` varchar(50) NULL,
  `description` varchar(255) NULL,
  `approver_objid` varchar(50) NULL,
  `approver_name` varchar(255) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_taxincentive
-- ----------------------------

-- ----------------------------
-- Table structure for businessrequirementtype
-- ----------------------------
DROP TABLE IF EXISTS `businessrequirementtype`;
CREATE TABLE `businessrequirementtype` (
  `objid` varchar(50) NOT NULL,
  `code` varchar(50) NULL,
  `title` varchar(255) NULL,
  `type` varchar(50) NULL,
  `handler` varchar(50) NULL,
  `system` int(11) NULL,
  `agency` varchar(50) NULL,
  `sortindex` int(11) NULL,
  `verifier` varchar(255) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_code` (`code`),
  UNIQUE KEY `uix_title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of businessrequirementtype
-- ----------------------------
INSERT INTO `businessrequirementtype` VALUES ('BC', 'BC', 'BARANGAY CLEARANCE', null, null, null, 'BARANGAY', null, null);
INSERT INTO `businessrequirementtype` VALUES ('BIR', 'BIR', 'BIR CLEARANCE', null, null, null, 'BIR', null, null);
INSERT INTO `businessrequirementtype` VALUES ('CDA', 'CDA', 'CDA', null, null, null, 'CDA', null, null);
INSERT INTO `businessrequirementtype` VALUES ('CTC', 'CTC', 'COMMUNITY TAX CERTIFICATE', null, null, null, 'TREASURY OFFICE', null, null);
INSERT INTO `businessrequirementtype` VALUES ('DTI', 'DTI', 'DEPARTMENT OF TRADE & INDUSTRY', 'DOC', null, null, 'DEPARTMENT OF TRADE & INDUSTRY', '0', null);
INSERT INTO `businessrequirementtype` VALUES ('FSIC', 'FSIC', 'FIRE SAFETY INSPECTION CLEARANCE', null, null, null, 'BFP', null, null);
INSERT INTO `businessrequirementtype` VALUES ('HDMF', 'HDMF', 'HDMF CLEARANCE', null, null, null, 'PAG-IBIG', null, null);
INSERT INTO `businessrequirementtype` VALUES ('OP', 'OP', 'OCCUPANCY PERMIT', null, null, null, 'ENGINEERING', null, null);
INSERT INTO `businessrequirementtype` VALUES ('PC', 'PC', 'POLICE CLEARANCE', null, null, null, 'PNP', null, null);
INSERT INTO `businessrequirementtype` VALUES ('PH', 'PH', 'PHILHEALTH CLEARANCE', null, null, null, 'PHILHEALTH', null, null);
INSERT INTO `businessrequirementtype` VALUES ('RPT', 'RPT', 'RPT CLEARANCE', null, null, null, 'ASSESSOR\'S OFFICE', null, null);
INSERT INTO `businessrequirementtype` VALUES ('SEC', 'SEC', 'SECURITY AND EXCHANGE COMMISION', null, null, null, 'SECURITY AND EXCHANGE COMMISION', '0', null);
INSERT INTO `businessrequirementtype` VALUES ('SP', 'SP', 'SANITARY PERMIT', null, null, null, 'HEALTH', null, null);
INSERT INTO `businessrequirementtype` VALUES ('SSS', 'SSS', 'SSS CLEARANCE', null, null, null, 'SSS', null, null);
INSERT INTO `businessrequirementtype` VALUES ('TIN', 'TIN', 'TAX IDENTIFICATION NUMBER', null, null, null, 'BIR', '0', null);
INSERT INTO `businessrequirementtype` VALUES ('ZC', 'ZC', 'ZONING CLEARANCE', null, null, null, 'MPDC', null, null);

-- ----------------------------
-- Table structure for businessvariable
-- ----------------------------
DROP TABLE IF EXISTS `businessvariable`;
CREATE TABLE `businessvariable` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `datatype` varchar(20) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `description` varchar(100) NULL,
  `arrayvalues` longtext,
  `system` int(11) NULL,
  `sortorder` int(11) NULL,
  `category` varchar(100) NULL,
  `handler` varchar(50) NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of businessvariable
-- ----------------------------
INSERT INTO `businessvariable` VALUES ('AREA_SQM', 'DRAFT', 'AREA_SQM', 'decimal', 'BUSINESS AREA IN SQ METERS', null, null, '1', '0', 'BUSINESS AREA', null);
INSERT INTO `businessvariable` VALUES ('ASSET_SIZE', 'DRAFT', 'ASSET_SIZE', 'decimal', 'ASSET SIZE', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('BUSINESS_CHARACTERISTIC', 'DRAFT', 'BUSINESS_CHARACTERISTIC', 'string', 'BUSINESS CHARACTERISTIC', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('CAPITAL', 'DRAFT', 'CAPITAL', 'decimal', 'CAPITAL', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('DECLARED_CAPITAL', 'DRAFT', 'DECLARED_CAPITAL', 'decimal', 'DECLARED CAPITAL', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('DECLARED_GROSS', 'DRAFT', 'DECLARED_GROSS', 'decimal', 'DECLARED GROSS', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('GROSS', 'DRAFT', 'GROSS', 'decimal', 'GROSS', null, null, '1', '0', null, null);
INSERT INTO `businessvariable` VALUES ('NUM_EMPLOYEE', 'DRAFT', 'NUM_EMPLOYEE', 'integer', 'NO. OF EMPLOYEES', null, null, '1', '0', 'EMPLOYEE INFO', null);
INSERT INTO `businessvariable` VALUES ('NUM_EMPLOYEE_FEMALE', 'DRAFT', 'NUM_EMPLOYEE_FEMALE', 'integer', 'NO. OF FEMALE EMPLOYEES', null, null, '1', '0', 'EMPLOYEE INFO', null);
INSERT INTO `businessvariable` VALUES ('NUM_EMPLOYEE_MALE', 'DRAFT', 'NUM_EMPLOYEE_MALE', 'integer', 'NO. OF MALE EMPLOYEES', null, null, '1', '0', 'EMPLOYEE INFO', null);
INSERT INTO `businessvariable` VALUES ('NUM_EMPLOYEE_RESIDENT', 'DRAFT', 'NUM_EMPLOYEE_RESIDENT', 'integer', 'NO. OF RESIDENT EMPLOYEES', null, null, '1', '0', 'EMPLOYEE RESIDING IN LGU', null);
INSERT INTO `businessvariable` VALUES ('NUM_UNIT', 'DRAFT', 'NUM_UNIT', 'integer', 'NO. OF UNITS', null, null, '1', '0', null, null);

-- ----------------------------
-- Table structure for lob
-- ----------------------------
DROP TABLE IF EXISTS `lob`;
CREATE TABLE `lob` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `classification_objid` varchar(50) NOT NULL,
  `psic` varchar(50) NULL,
  `psic_objid` varchar(50) NULL,
  `_ukey` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_name` (`name`,`_ukey`),
  KEY `ix_name` (`name`),
  KEY `ix_classification_objid` (`classification_objid`),
  KEY `ix_psic` (`psic`),
  KEY `ix_psic_objid` (`psic_objid`),
  CONSTRAINT `lob_classification_objid_ibfk_1` FOREIGN KEY (`classification_objid`) REFERENCES `lobclassification` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lob
-- ----------------------------
INSERT INTO `lob` VALUES ('L-4e11e804:140b810a4bc:-7f1f', 'DRAFT', 'ART AND SIGNS', 'CONTRACTOR', '', null, 'L-4e11e804:140b810a4bc:-7f1f');
INSERT INTO `lob` VALUES ('LOB-306e5f4e:143ad0e382a:-77fb', 'DRAFT', 'HARDWARE.', 'RETAILER', null, null, 'LOB-306e5f4e:143ad0e382a:-77fb');
INSERT INTO `lob` VALUES ('LOB-306e5f4e:143ad0e382a:-7d6d', 'DRAFT', 'RETAILER OF APPLIANCES', 'RETAILER', null, null, 'LOB-306e5f4e:143ad0e382a:-7d6d');
INSERT INTO `lob` VALUES ('LOB-338109a4:150116a2ff5:-7fc1', 'DRAFT', 'ANIMAL CLINIC', 'OTHER', null, null, 'LOB-338109a4:150116a2ff5:-7fc1');
INSERT INTO `lob` VALUES ('LOB-3c6ae22:13f11bb91cc:-7d8c', 'DRAFT', 'GENERAL MERCHANDISING', 'WHOLESALER', null, null, 'LOB-3c6ae22:13f11bb91cc:-7d8c');
INSERT INTO `lob` VALUES ('LOB-3e1608b6:11ed7c33ac0:-7897', 'DRAFT', 'LENDING & FINANCING', 'FINANCIAL', null, null, 'LOB-3e1608b6:11ed7c33ac0:-7897');
INSERT INTO `lob` VALUES ('LOB-44903004:11c6371807a:-7d12', 'DRAFT', 'BARBER SHOP', 'CONTRACTOR', null, null, 'LOB-44903004:11c6371807a:-7d12');
INSERT INTO `lob` VALUES ('LOB-44903004:11c6371807a:-7ddc', 'DRAFT', 'DOMESTIC LIQUOR', 'RETAILER', null, null, 'LOB-44903004:11c6371807a:-7ddc');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7cb5', 'DRAFT', 'WHOLESALER OF RICE & CORN', 'WHOLESALER', null, null, 'LOB-49570e78:11c64cdad88:-7cb5');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7cc8', 'DRAFT', 'WHOLESALER OF AGRICULTURAL PRODUCTS', 'WHOLESALER', null, null, 'LOB-49570e78:11c64cdad88:-7cc8');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7d71', 'DRAFT', 'WHOLESALER OF GROCERIES', 'WHOLESALER', null, null, 'LOB-49570e78:11c64cdad88:-7d71');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7da0', 'DRAFT', 'WHOLESALER OF LEAF TOBACCO', 'WHOLESALER', null, null, 'LOB-49570e78:11c64cdad88:-7da0');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7f1e', 'DRAFT', 'REFRESHMENT PARLOR', 'OTHER', null, null, 'LOB-49570e78:11c64cdad88:-7f1e');
INSERT INTO `lob` VALUES ('LOB-49570e78:11c64cdad88:-7f64', 'DRAFT', 'PAWNSHOP', 'FINANCIAL', null, null, 'LOB-49570e78:11c64cdad88:-7f64');
INSERT INTO `lob` VALUES ('LOB-4efb7d4a:157943708fd:-7e24', 'DRAFT', 'FURNITURE SHOP', 'WHOLESALER', null, null, 'LOB-4efb7d4a:157943708fd:-7e24');
INSERT INTO `lob` VALUES ('LOB-593386c4:11d94bd6fd9:-722c', 'DRAFT', 'DEALER OF APPLIANCES', 'WHOLESALER', null, null, 'LOB-593386c4:11d94bd6fd9:-722c');
INSERT INTO `lob` VALUES ('LOB-5aeab750:11f2607ba03:-7cf8', 'DRAFT', 'AUTO REPAIR SHOP', 'CONTRACTOR', null, null, 'LOB-5aeab750:11f2607ba03:-7cf8');
INSERT INTO `lob` VALUES ('LOB-6f90134e:11e191f44b9:-7e03', 'DRAFT', 'MONEY TRANSFER', 'FINANCIAL', null, null, 'LOB-6f90134e:11e191f44b9:-7e03');
INSERT INTO `lob` VALUES ('LOB19be627b:12d7d693799:-686c', 'DRAFT', 'MEAT SHOP', 'RETAILER', null, null, 'LOB19be627b:12d7d693799:-686c');
INSERT INTO `lob` VALUES ('LOB1f38a8f3:15d81dca6d4:-779a', 'DRAFT', 'SARI-SARI', 'RETAILER', null, null, 'LOB1f38a8f3:15d81dca6d4:-779a');
INSERT INTO `lob` VALUES ('LOB3c390eb3:11ece68f4f9:-6a7d', 'DRAFT', 'DEALER OF AGRI-MACHINERY', 'WHOLESALER', null, null, 'LOB3c390eb3:11ece68f4f9:-6a7d');
INSERT INTO `lob` VALUES ('LOB3c390eb3:11ece68f4f9:-6b28', 'DRAFT', 'MICRO-FINANCING', 'FINANCIAL', null, null, 'LOB3c390eb3:11ece68f4f9:-6b28');
INSERT INTO `lob` VALUES ('LOB3e8e3cf5:1579cb6312d:-7423', 'DRAFT', 'COCKPIT', 'AMUSEMENT', null, null, 'LOB3e8e3cf5:1579cb6312d:-7423');
INSERT INTO `lob` VALUES ('LOB404b5682:157942029f9:-76ad', 'DRAFT', 'RESTAURANT', 'OTHER', null, null, 'LOB404b5682:157942029f9:-76ad');
INSERT INTO `lob` VALUES ('LOB420b42bb:145688603f4:-7fbb', 'DRAFT', 'RETAILER OF BAKERY SUPPLIES', 'RETAILER', null, null, 'LOB420b42bb:145688603f4:-7fbb');
INSERT INTO `lob` VALUES ('LOB48441c91:161873af778:-4db8', 'DRAFT', 'MANUFACTURER OF SHOES', 'MANUFACTURER', null, null, 'LOB48441c91:161873af778:-4db8');
INSERT INTO `lob` VALUES ('LOB490eb47a:12eb2e532f1:-7e10', 'DRAFT', 'FASHION ACCESSORIES', 'WHOLESALER', null, null, 'LOB490eb47a:12eb2e532f1:-7e10');
INSERT INTO `lob` VALUES ('LOB56955d96:11c6516e07c:-7f81', 'DRAFT', 'DRUG STORE', 'RETAILER', null, null, 'LOB56955d96:11c6516e07c:-7f81');
INSERT INTO `lob` VALUES ('LOB56a66952:160e7b17a95:-6f27', 'DRAFT', 'BAKERY.', 'MANUFACTURER', null, null, 'LOB56a66952:160e7b17a95:-6f27');
INSERT INTO `lob` VALUES ('LOB78e2e09:14ddc1a18ac:-7f64', 'DRAFT', 'ADMINISTRATIVE SERVICES', 'OTHER', null, null, 'LOB78e2e09:14ddc1a18ac:-7f64');

-- ----------------------------
-- Table structure for lob_lobattribute
-- ----------------------------
DROP TABLE IF EXISTS `lob_lobattribute`;
CREATE TABLE `lob_lobattribute` (
  `lobid` varchar(50) NOT NULL,
  `lobattributeid` varchar(50) NOT NULL,
  PRIMARY KEY (`lobid`,`lobattributeid`),
  KEY `lobattributeid` (`lobattributeid`),
  CONSTRAINT `lob_lobattribute_ibfk_1` FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`),
  CONSTRAINT `lob_lobattribute_ibfk_2` FOREIGN KEY (`lobattributeid`) REFERENCES `lobattribute` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lob_lobattribute
-- ----------------------------

-- ----------------------------
-- Table structure for lob_report_category
-- ----------------------------
DROP TABLE IF EXISTS `lob_report_category`;
CREATE TABLE `lob_report_category` (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `groupid` varchar(50) NULL,
  `title` varchar(255) NULL,
  `itemtype` varchar(25) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_parentid` (`parentid`),
  KEY `ix_groupid` (`groupid`),
  CONSTRAINT `fk_lob_report_category_groupid` FOREIGN KEY (`groupid`) REFERENCES `lob_report_group` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lob_report_category
-- ----------------------------

-- ----------------------------
-- Table structure for lob_report_category_mapping
-- ----------------------------
DROP TABLE IF EXISTS `lob_report_category_mapping`;
CREATE TABLE `lob_report_category_mapping` (
  `objid` varchar(50) NOT NULL,
  `lobid` varchar(50) NOT NULL,
  `categoryid` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  UNIQUE KEY `uix_categoryid` (`categoryid`),
  KEY `ix_lobid` (`lobid`),
  CONSTRAINT `fk_lob_report_category_mapping_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `lob_report_category` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lob_report_category_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for lob_report_group
-- ----------------------------
DROP TABLE IF EXISTS `lob_report_group`;
CREATE TABLE `lob_report_group` (
  `objid` varchar(50) NOT NULL,
  `title` varchar(255) NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lob_report_group
-- ----------------------------

-- ----------------------------
-- Table structure for lobattribute
-- ----------------------------
DROP TABLE IF EXISTS `lobattribute`;
CREATE TABLE `lobattribute` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lobattribute
-- ----------------------------
INSERT INTO `lobattribute` VALUES ('ESSENTIAL', 'DRAFT', 'ESSENTIAL', 'ESSENTIAL');
INSERT INTO `lobattribute` VALUES ('HAS_WEIGHT_AND_MEASURE', 'DRAFT', 'HAS_WEIGHT_AND_MEASURE', 'HAS WEIGHT AND MEASURE');
INSERT INTO `lobattribute` VALUES ('NO_BUSINESS_TAX', 'DRAFT', 'NO_BUSINESS_TAX', 'NO BUSINESS TAX');

-- ----------------------------
-- Table structure for lobclassification
-- ----------------------------
DROP TABLE IF EXISTS `lobclassification`;
CREATE TABLE `lobclassification` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remarks` varchar(100) NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lobclassification
-- ----------------------------
INSERT INTO `lobclassification` VALUES ('AMUSEMENT', 'APPROVED', 'AMUSEMENT', null);
INSERT INTO `lobclassification` VALUES ('CONTRACTOR', 'APPROVED', 'CONTRACTOR', null);
INSERT INTO `lobclassification` VALUES ('FINANCIAL', 'APPROVED', 'FINANCIAL', null);
INSERT INTO `lobclassification` VALUES ('MANUFACTURER', 'APPROVED', 'MANUFACTURER', null);
INSERT INTO `lobclassification` VALUES ('OTHER', 'APPROVED', 'OTHER', null);
INSERT INTO `lobclassification` VALUES ('RETAILER', 'APPROVED', 'RETAILER', null);
INSERT INTO `lobclassification` VALUES ('SERVICE', 'APPROVED', 'SERVICE', null);
INSERT INTO `lobclassification` VALUES ('WHOLESALER', 'APPROVED', 'WHOLESALER', null);


INSERT INTO `sys_wf` (`name`, `title`, `domain`) VALUES ('business_application', 'Business Application Workflow', NULL);

INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('approval', 'business_application', 'Approval', 'state', '6', '0', 'BPLS', 'APPROVER', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('assessment', 'business_application', 'Assessment', 'state', '4', '100', 'BPLS', 'ASSESSOR', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('assign-assessor', 'business_application', 'Assign Assessor', 'state', '2', '0', 'BPLS', 'ASSESSOR', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('end', 'business_application', 'end', 'end', '10', '0', 'BPLS', NULL, NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('payment', 'business_application', 'For Payment', 'state', '8', '0', 'BPLS', 'APPROVER', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('reassessment', 'business_application', 'Reassessment', 'state', '7', '0', 'BPLS', 'ASSESSOR', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('release', 'business_application', 'For Release', 'state', '9', '0', 'BPLS', 'LICENSING', NULL, NULL, NULL);
INSERT INTO `sys_wf_node` (`name`, `processname`, `title`, `nodetype`, `idx`, `salience`, `domain`, `role`, `properties`, `ui`, `tracktime`) VALUES ('start', 'business_application', 'Start', 'start', '0', '0', 'BPLS', NULL, NULL, NULL, NULL);

INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('approval', 'business_application', 'submit', 'payment', '0', NULL, '[\n  caption:\"Approve For Payment\",\n  icon:\"approve\",\n  confirm: ''You are about to submit this for payment. Proceed?''\n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('approval', 'business_application', 'return-assessment', 'reassessment', '1', NULL, '[\n   caption:\"Return to assessment\",\n   icon: \"return\",\n   messagehandler: ''default''  \n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('assessment', 'business_application', 'submit', 'approval', NULL, NULL, '[\n   caption: ''Submit for Approval'',\n   icon: ''approve'',\n   messagehandler: ''default''   \n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('assign-assessor', 'business_application', '', 'assessment', NULL, NULL, '[\n   caption:\"Assign To Me\",\n   icon: \"approve\"\n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('payment', 'business_application', 'reverse-approval', 'approval', '2', NULL, '[caption:''Reverse Approval'']', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('payment', 'business_application', 'revert', 'payment', '2', NULL, '[caption:''Reverse Payment'', visible:false]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('payment', 'business_application', 'release', 'release', '1', NULL, '[visible:false]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('reassessment', 'business_application', '', 'approval', NULL, NULL, '[\n  caption:\"Submit for Approval\",\n  messagehandler: ''default'' \n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('release', 'business_application', 'submit', 'end', '2', NULL, '[\ncaption:''Release'', \nconfirm: ''You are about to release this application. Proceed?''\n]', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('release', 'business_application', 'revert', 'payment', '3', NULL, '[caption:''Return to Assessor'', messagehandler:''default'']', NULL, NULL, NULL);
INSERT INTO `sys_wf_transition` (`parentid`, `processname`, `action`, `to`, `idx`, `eval`, `properties`, `permission`, `caption`, `ui`) VALUES ('start', 'business_application', '', 'assign-assessor', '1', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.ADMIN', 'BPLS ADMINISTRATOR', 'BPLS', 'usergroup', NULL, 'ADMIN');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.APPROVER', 'BUSINESS APPROVER', 'BPLS', 'usergroup', NULL, 'APPROVER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.ASSESSOR', 'BPLS ASSESSOR', 'BPLS', 'usergroup', NULL, 'ASSESSOR');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.BUSINESSINFO', 'BUSINESS INFORMATION', 'BPLS', 'usergroup', NULL, 'BUSINESSINFO');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.CAPTURE_ENCODER', 'BPLS CAPTURE ENCODER', 'BPLS', 'usergroup', NULL, 'CAPTURE_ENCODER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.CEO', 'BPLS CEO', 'BPLS', 'usergroup', NULL, 'CEO');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.EXT', 'BPLS EXT', 'BPLS', NULL, NULL, 'EXT');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.LICENSING', 'BPLS LICENSING', 'BPLS', 'usergroup', NULL, 'LICENSING');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.MASTER', 'BPLS MASTER', 'BPLS', 'usergroup', NULL, 'MASTER');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.PRINTING', 'BPLS PRINTING', 'BPLS', 'usergroup', NULL, 'PRINTING');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.REPORT', 'BPLS REPORT', 'BPLS', 'usergroup', NULL, 'REPORT');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.RULE_AUTHOR', 'BPLS RULE AUTHOR', 'BPLS', 'usergroup', NULL, 'RULE_AUTHOR');
INSERT INTO `sys_usergroup` (`objid`, `title`, `domain`, `userclass`, `orgclass`, `role`) VALUES ('BPLS.SHARED', 'BPLS SHARED', 'BPLS', 'usergroup', NULL, 'SHARED');
